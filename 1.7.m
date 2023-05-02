function [min_dist, tile_size, N] = harris_detector(input_image, varargin)
    % In this function you are going to implement a Harris detector that extracts features
    % from the input_image.
    
    %% Input parser
    p = inputParser;
    
    addParameter(p,'min_dist',20,@(x)validateattributes(x,{'numeric'},{'>',1}));
    addParameter(p,'tile_size',[200,200],@(x)validateattributes(x,{'numeric'},{'2d'}));
    addParameter(p,'N',5,@(x)validateattributes(x,{'numeric'},{'>',1}));
       
    parse(p,varargin{:});
    
    min_dist = p.Results.min_dist;
    N = p.Results.N;
    
    % check if the input of tile_size is a value instead of a 2d-vector
    if size(p.Results.tile_size) == 1
        tile_size = [p.Results.tile_size, p.Results.tile_size];
    else
        tile_size = p.Results.tile_size;
    end

    
    
end