function [Fx, Fy] = sobel_xy(input_image)
    % In this function you have to implement a Sobel filter 
    % that calculates the image gradient in x- and y- direction of a grayscale image.
mx = [1 0 -1;2 0 -2;1 0 -1];
my = mx';

input_image = double(input_image);
Fx = conv2(input_image,mx, 'same');
Fy = conv2(input_image,my, 'same');


end