function [Ix, Iy, w, G11, G22, G12] = harris_detector(input_image, varargin)
    % In this function you are going to implement a Harris detector that extracts features
    % from the input_image.
    
    %% Input parser from task 1.3
    % segment_length    size of the image segment
    % k                 weighting between corner- and edge-priority
    % tau               threshold value for detection of a corner
    % do_plot           image display variable
    input_parser

    %% Preparation for feature extraction
    % Check if it is a grayscale image
     if size(input_image,3) ~= 1
         error('Image format has to be NxMx1');
     else   
    % Approximation of the image gradient
        [Fx, Fy] = sobel_xy(input_image);
        Ix = Fx;
        Iy = Fy;
        
        Ixx = Ix.^2;
        Iyy = Iy.^2;
        Ixy = Ix.*Iy;
        
    
    % Weighting
        w = fspecial('gaussian',[segment_length,1],segment_length/2);
        
    % Harris Matrix G
    % C = conv2(u,v,A) first convolves each column of A with the vector u,...
    % and then it convolves each row of the result with the vector v.
        G11 = double(conv2(w,w,Ixx, 'same'));
        G12 = double(conv2(w,w,Ixy, 'same'));
        G22 = double(conv2(w,w,Iyy, 'same'));
     end
    
end