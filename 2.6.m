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
    
    %% Correspondeces from task 2.5
    % cor                   matrix containing all corresponding image points
    correspondence
    
    %% Visualize the correspoinding image point pairs
    figure()
    whos cor
    imshow(uint8(I1));
    hold on
    imshow(uint8(I2));
    hold on 
    alpha(0.5);
    for i=1:size(cor,2)
        % cor image1 (x1,y1)
        plot(cor(1,:), cor(2,:), 'bs');
        % cor image2 (x2,y2)
        plot(cor(3,:), cor(4,:), 'ro');
        % cor point pair 1,2
        line([cor(1,i),cor(3,i)],[cor(2,i),cor(4,i)]);
        hold on
    end 
end