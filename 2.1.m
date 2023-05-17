function [window_length, min_corr, do_plot, Im1, Im2] = point_correspondence(I1, I2, Ftp1, Ftp2, varargin)
    % In this function you are going to compare the extracted features of a stereo recording
    % with NCC to determine corresponding image points.
    
    
    Im1 = double(I1);
    Im2 = double(I2);
%     whos Im2
    %% Input parser
    p = inputParser;
    
    addParameter(p,'window_length',25,@(x)validateattributes(x,{'numeric'},{'odd','>',1}));
    addParameter(p,'min_corr',0.95,@(x)validateattributes(x,{'numeric'},{'>',0,'<',1}));
    addParameter(p,'do_plot',false,@islogical); 
    addParameter(p,'Im1',{'double'}); 
    addParameter(p,'Im2',{'double'}); 

    parse(p,varargin{:});
    

    window_length = p.Results.window_length;
    min_corr = p.Results.min_corr;
    do_plot = p.Results.do_plot;
    

    
end