function [corners, sorted_index] = harris_detector(input_image, varargin)
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
    % features          detected features
    harris_measurement
    
    %% Feature preparation
    % expand matrix corners with a zero border

    sz = size(corners);
    expand = zeros(sz+2*min_dist);
    expand(1+min_dist:min_dist+sz(1), 1+min_dist:min_dist+sz(2)) = corners;
    corners = expand;
    
    %sort the indices of all non-zero features in corners in decreasing
   
    corners = corners(:);
    [~, sorted_index] = sort(corners, 'descend');
    num_non0 = nnz(corners);                          
    sorted_index = sorted_index(1:num_non0);
    corners = expand;
    
    
    
    
end