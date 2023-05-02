function [segment_length, k, tau, do_plot] = harris_detector(input_image, varargin)
    % In this function you are going to implement a Harris detector that extracts features
    % from the input_image.

    %% Input parser
    p = inputParser;
    
    addParameter(p,'segment_length',15,@(x)validateattributes(x,{'numeric'},{'odd','>',1}));
    addParameter(p,'k',0.05,@(x)validateattributes(x,{'numeric'},{'>',0,'<',1}));
    addParameter(p,'tau',1000000,@(x)validateattributes(x,{'numeric'},{'>',0}));
    addParameter(p,'do_plot',false,@islogical);    
    parse(p,varargin{:});
    
    segment_length=(p.Results.segment_length);
%     segment_length=double(segment_length)
    k = (p.Results.k);
    tau = (p.Results.tau);
    do_plot = p.Results.do_plot;
    
    
end