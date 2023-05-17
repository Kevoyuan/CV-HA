function [no_pts1, no_pts2, Ftp1, Ftp2] = point_correspondence(I1, I2, Ftp1, Ftp2, varargin)
    % In this function you are going to compare the extracted features of a stereo recording
    % with NCC to determine corresponding image points.
    
    %% Input parser from task 2.1
    % window_length     side length of quadratic window
    % min_corr          threshold for the correlation of two features
    % do_plot           image display variable
    % Im1, Im2          input images (double)
    input_parser
    
    %% Feature preparation
    % no_pts:       num. of remaining features
    % Ftp:          num. of all features
    whos Im1
    whos Ftp1
    
    % for Im1
    for i = 1:size(Ftp1, 2)
        % x: left border
        if Ftp1(1, i) < ceil(window_length/2)
            Ftp1(:,i) = 0;
        % x: right border
        elseif Ftp1(1, i) > size(Im1,2) - floor(window_length/2)
            Ftp1(:,i) = 0;
        % y: upper border    
        elseif Ftp1(2, i) < ceil(window_length/2)
            Ftp1(:,i) = 0;
        % y: lower border
        elseif Ftp1(2, i) > size(Im1,1) - floor(window_length/2)
            Ftp1(:,i) = 0; 
        end
    end
 
    Ftp1(:,any(Ftp1==0,1)) = [];
    no_pts1 = size(Ftp1, 2);
    
    
    % for Im2
    for i = 1:size(Ftp2, 2)
        % x: left border
        if Ftp2(1, i) < ceil(window_length/2)
            Ftp2(:,i) = 0;
        % x: right border
        elseif Ftp2(1, i) > size(Im2,2) - floor(window_length/2)
            Ftp2(:,i) = 0;
        % y: upper border    
        elseif Ftp2(2, i) < ceil(window_length/2)
            Ftp2(:,i) = 0;
        % y: lower border
        elseif Ftp2(2, i) > size(Im2,1) - floor(window_length/2)
            Ftp2(:,i) = 0; 
        end
    end

    Ftp2(:,any(Ftp2==0,1)) = [];
    no_pts2 = size(Ftp2, 2);    

end