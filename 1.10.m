function [acc_array, features] = harris_detector(input_image, varargin)
    % In this function you are going to implement a Harris detector that extracts features
    % from the input_image.
    
    %% Input parser from task 1.7
    % segment_length    size of the image segment
    % k                 weighting between corner- and edge-priority
    % tau               threshold value for detection of a corner
    % do_plot           image display variable
    % min_dist          minimal distance of two features in pixels
    % tile_size         size of the tiles
    % N                 maximal number of features per tile
    input_parser_new

    %% Preparation for feature extraction from task 1.4
    % Ix, Iy            image gradient in x- and y-direction
    % w                 weighting vector
    % G11, G12, G22     entries of the Harris matrix
    image_preprocessing
    
    %% Feature extraction with the Harris measurement from task 1.5
    % corners           matrix containing the value of the Harris measurement for each pixel         
    harris_measurement
    
    %% Feature preparation from task 1.9
    %corners            Harris measurement for each pixel respecting the minimal distance
    %sorted_index       Index list of features sorted descending by thier strength
    feature_preprocessing
    
    %% Accumulator array
    sz = size(input_image);
    
    acc_array = zeros(ceil(sz(1)/tile_size(1)), ceil(sz(2)/tile_size(2)));
    
    features = zeros(2, (min(numel(sorted_index), numel(acc_array)*N)));
    
end