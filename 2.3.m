function [Mat_feat_1, Mat_feat_2] = point_correspondence(I1, I2, Ftp1, Ftp2, varargin)
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
    
    %% Normalization
    
    % initialize Mat_feat_1, Mat_feat_2
    Mat_feat_1 = zeros(window_length^2, no_pts1);
    Mat_feat_2 = zeros(window_length^2, no_pts2);
    
    % window size index
    win_Ix = -floor(window_length/2):floor(window_length/2);
    
    % extract all valid features
    for i = 1 : no_pts1
        x = Ftp1(1, i);
        y = Ftp1(2, i);
        % all positions of windows in image1(double)
        win = Im1(y + win_Ix, x + win_Ix);
%         whos win
        % Normalization
        Mat_feat_1(:, i) = (win(:)-mean(win(:)))/std(win(:));
    end
    
    for i = 1 : no_pts2
        x = Ftp2(1, i);
        y = Ftp2(2, i);
        % all positions of windows in image2
        win = Im2(y + win_Ix, x + win_Ix);
        
        Mat_feat_2(:, i) = (win(:)-mean(win(:)))/std(win(:));
    end
    
    
end