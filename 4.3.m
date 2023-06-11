function [T, R, lambda, M1, M2] = reconstruction(T1, T2, R1, R2, correspondences, K)
    %% Preparation from task 4.2
    % T_cell    cell array with T1 and T2 
    % R_cell    cell array with R1 and R2
    % d_cell    cell array for the depth information
    % x1        homogeneous calibrated coordinates
    % x2        homogeneous calibrated coordinates
    preparation
    
    %% Reconstruction
    
    N = size(correspondences, 2);
    M1 = zeros(3*N, N+1);
    M2 = zeros(3*N, N+1);

    for i = 1:4
        T = T_cell{i};
        R = R_cell{i};
        for j = 1:N
            x1_hat = [0 -x1(3,j) x1(2,j); x1(3,j) 0 -x1(1,j); -x1(2,j) x1(1,j) 0];
            x2_hat = [0 -x2(3,j) x2(2,j); x1(3,j) 0 -x2(1,j); -x2(2,j) x2(1,j) 0];
            
            M1((j-1)*3+1:(j-1)*3+3,j) = x2_hat * R * x1(:,j);
            M1((j-1)*3+1:(j-1)*3+3,N+1) = x2_hat * T;
            M2((j-1)*3+1:(j-1)*3+3,j) = x1_hat * R' * x2(:,j);
            M2((j-1)*3+1:(j-1)*3+3,N+1) = -x1_hat * R' * T;
        end
        [~,~,V1] = svd(M1);
        [~,~,V2] = svd(M2);
        
        % depth
        d1 = V1(:, end);
        d2 = V2(:, end); 
        
        % normalize
        d1 = d1./d1(end);
        d2 = d2./d2(end);
        d_cell{i} = [d1(1:end-1), d2(1:end-1)];
                
    end
    % find most positive entries in d_cell
     num_pos = cellfun(@(a) length(nonzeros(a(a>0))), d_cell, 'UniformOutput',false);
     num_pos = cell2mat(num_pos);
     [~, maxIndex] = max(num_pos);
     
     T = T_cell{maxIndex};
     R = R_cell{maxIndex};
     lambda = d_cell{maxIndex};

     
    
 
        
    
end