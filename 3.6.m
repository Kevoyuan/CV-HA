function [correspondences_robust, largest_set_F] = F_ransac(correspondences, varargin)
    % This function implements the RANSAC algorithm to determine 
    % robust corresponding image points
       
    %% Input parser
    % Known variables:
    % epsilon       estimated probability
    % p             desired probability
    % tolerance     tolerance to belong to the consensus-set
    % x1_pixel      homogeneous pixel coordinates
    % x2_pixel      homogeneous pixel coordinates
    input_parser
        
    %% RANSAC algorithm preparation
    % Pre-initialized variables:
    % k                     number of necessary points
    % s                     iteration number
    % largest_set_size      size of the so far biggest consensus-set
    % largest_set_dist      Sampson distance of the so far biggest consensus-set
    % largest_set_F         fundamental matrix of the so far biggest consensus-set
    ransac_preparation
    
    %% RANSAC algorithm
    set_size = largest_set_size;
    set_dist = largest_set_dist;
    
    % perform each of these steps in every iteration i<=s
    for i = 1:s
        % 1. randomly choose corresponding image points
        random = randperm(size(correspondences,2)) ;
        correspondences_robust_can = [];
        for j = 1:k
            correspondences_robust_can(:,j) = correspondences(:,random(:,j));
        end
        % estimate the fundamental matrix
        F = epa(correspondences_robust_can);
        % 2. calsulate the Sampson distance for all corresponding image points
        s_dist = sampson_dist(F, x1_pixel, x2_pixel)
        % 3. if sd<tolerance, the corresponding points are includes in consensus set
        x1_pixel_robust = correspondences_robust_can(1:2,:);
        x1_pixel_robust(3,:) = ones(1, size(x1_pixel_robust,2));
        x2_pixel_robust = correspondences_robust_can(3:4,:);
        x2_pixel_robust(3,:) = ones(1, size(x2_pixel_robust,2));
        for m = 1:size(correspondences_robust_can,2)
            sd = sampson_dist(F, x1_pixel_robust, x2_pixel_robust)
            % 4. calculate the num of corr points and the sum of Sampson dist
            if sd < tolerance 
                set_size = set_size + 1 ; 
                set_dist = set_dist + sd ;
            else
                % mark the columns that are supposed to be delete                
                correspondences_robust_can(:,m) = zeros(4,1);
            end
        end
         % delete 0 column
        correspondences_robust_can(all(correspondences_robust_can==0,1))=[];
        % 5. & 6. 
        if set_size > largest_set_size
            largest_set_size = set_size;
            largest_set_dist = set_dist;
            largest_set_F = F;
            correspondences_robust = correspondences_robust_can; 
        elseif set_size == largest_set_size & set_dist < largest_set_dist
            largest_set_dist = set_dist;
            largest_set_F = F;
            correspondences_robust = correspondences_robust_can;
        end
    end

end