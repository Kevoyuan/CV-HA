function features = harris_detector(input_image, varargin)
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
    % sorted_index      sorted indices of features in decreasing order of feature strength
    feature_preprocessing
    
    %% Accumulator array from task 1.10
    % acc_array         accumulator array which counts the features per tile
    % features          empty array for storing the final features
    accumulator_array
    
    %% Feature detection with minimal distance and maximal number of features per tile
    Cake = cake(min_dist);
    % number of new features
    n = 0;
    % index to coordinate, y=row, x=col
    [y,x] = ind2sub(size(corners), sorted_index);
    
    for i = 1:length(sorted_index)
        x_acc = ceil((x(i)-min_dist)/tile_size(2)) ;
        y_acc = ceil((y(i)-min_dist)/tile_size(1)) ; 
        
        if corners(y(i), x(i)) ~=0 && acc_array(y_acc, x_acc) < N
            % use cake function & mark the features' coordinate
            acc_array(y_acc, x_acc) = acc_array(y_acc, x_acc)+1;
            features(:,n+1) = [x(i)-min_dist; y(i)-min_dist];
            n = n + 1;
            corners(y(i)-min_dist:y(i)+min_dist, x(i)-min_dist:x(i)+min_dist) = corners(y(i)-min_dist:y(i)+min_dist, x(i)-min_dist:x(i)+min_dist).* Cake; 
        end
    end
    features = features(:, 1:n) ;

    % Plot Routine
    plotting
    
end