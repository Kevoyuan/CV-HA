function [H, corners, features] = harris_detector(input_image, varargin)
    % In this function you are going to implement a Harris detector that extracts features
    % from the input_image.
    
    %% Input parser from task 1.3
    % segment_length    size of the image segment
    % k                 weighting between corner- and edge-priority
    % tau               threshold value for detection of a corner
    % do_plot           image display variable
    input_parser

    %% Preparation for feature extraction from task 1.4
    % Ix, Iy            image gradient in x- and y-direction
    % w                 weighting vector
    % G11, G12, G22     entries of the Harris matrix
    image_preprocessing
    
    %% Feature extraction with the Harris measurement
    H = zeros(size(double(input_image)));
    det_G = G11.*G22-G12.^2;
    trace_G = G11+G22;
    H = det_G-k*trace_G.^2;

    % expand the matrix H with zero
    borderDistance = ceil(segment_length/2);
    borderMask = zeros(size(H));
    borderMask(borderDistance+1:size(H,1)-borderDistance,borderDistance+1:size(H,2)-borderDistance)=1;
    corners = H .* borderMask;

    % eliminate features in corners which smaller than tau
    corners(corners<tau) = 0; 
    
    % find nonzero coordinations
    [x, y] = find(ceil(corners~=0));
    features = [y'; x'];
    
    
    
end