function [NCC_matrix, sorted_index] = point_correspondence(I1, I2, Ftp1, Ftp2, varargin)
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
    
    %% NCC calculations
    % num. of pixels
    N = size(Mat_feat_1,1);
    NCC_matrix = 1/(N-1)*Mat_feat_2'*Mat_feat_1; 
    % set all entries in NCC_matrix to zero that below min_corr
    NCC_matrix(NCC_matrix < min_corr) = 0;
    
    % sort the indices of non zero entries in NCC_matrix
    [~,sorted_index] = sort(NCC_matrix(:),'descend');
    % count none zero entries
    num_non0 = nnz(NCC_matrix(:));
    sorted_index = sorted_index(1:num_non0, :);
    
end