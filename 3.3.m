function [epsilon, p, tolerance, x1_pixel, x2_pixel] = F_ransac(correspondences, varargin)
    % This function implements the RANSAC algorithm to determine 
    % robust corresponding image points
    p = inputParser;
    % epsilon 50,0%
    defaultepsilon = double(0.5);         
    validScalarPosNum1 = @(x) isnumeric(x) && (x > 0) && (x < 1);
    addOptional(p,'epsilon',defaultepsilon, validScalarPosNum1);
    % p 50,0%
    defaultp = double(0.5);         
    validScalarPosNum2 = @(x) isnumeric(x) && (x > 0) && (x < 1);
    addOptional(p,'p',defaultp, validScalarPosNum2);
    % tolerance 0.01
    defaulttolerance = 0.01;         
    validScalarPosNum3 = @(x) isnumeric(x) && (x > 0) && (x < 1);
    addOptional(p,'tolerance',defaulttolerance, validScalarPosNum3);
    % Parses the input in the function 
    parse(p, varargin{:});
    % output correspond parameter 
    epsilon = p.Results.epsilon
    tolerance = p.Results.tolerance
    p = p.Results.p   
    
    % x1_pixel
    x1_pixel = [];
    x1_pixel(1:2,:) = correspondences(1:2,:);
    x1_pixel(3,:) = ones(1,size(x1_pixel,2));
    % x2_pixel
    x2_pixel = [];
    x2_pixel(1:2,:) = correspondences(3:4,:);
    x2_pixel(3,:) = ones(1,size(x2_pixel,2));
    
end