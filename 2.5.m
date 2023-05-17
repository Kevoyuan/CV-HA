function cor = point_correspondence(I1, I2, Ftp1, Ftp2, varargin)
    % In this function you are going to compare the extracted features of a stereo recording
    % with NCC to determine corresponding image points.
    
    %% Input parser from task 2.1
    % window_length         side length of quadratic window
    % min_corr              threshold for the correlation of two features
    % do_plot               image display variable
    % Im1, Im2              input images (double)
    input_parser
    
    %% Feature preparation from task 2.2
    % no_pts1, no_pts 2     number of features remaining in each image
    % Ftp1, Ftp2            preprocessed features
    feature_preprocessing
    
    %% Normalization from task 2.3
    % Mat_feat_1            normalized windows in image 1
    % Mat_feat_2            normalized windows in image 2
    window_normalization
    
    %% NCC from task 2.4
    % NCC_matrix            matrix containing the correlation between the image points
    % sorted_index          sorted indices of NCC_matrix entries in decreasing order of intensity
    ncc_calculation
    
    %% Correspondeces
    % initialize correspondeces matrix
    cor = zeros(4, min(no_pts1, no_pts2));
    % y:column in image2 , x: column in image1
    [y,x] = ind2sub(size(NCC_matrix), sorted_index);
    
    num_feature = 1
    for i = 1:numel(sorted_index)
        if NCC_matrix(sorted_index(i))~=0
           % find and save all correspondence points
           fea(:,num_feature) = [Ftp1(:,x(i));Ftp2(:,y(i))];
           % set the repectly column to be zero in image1
           NCC_matrix(:,x(i)) = 0;
           
           num_feature = num_feature+1;
        end
    end
    cor = fea(:,1:num_feature-1);
    
    
    
end