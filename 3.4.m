function [k, s, largest_set_size, largest_set_dist, largest_set_F] = F_ransac(correspondences, varargin)
    % This function implements the RANSAC algorithm to determine 
    % robust corresponding image points
       
    %% Input parser
    % Known variables:
    % epsilon       estimated probability
    % p             desired probability
    % tolerance     tolerance to belong to the consensus-set
    % x1_pixel      homogeneous pixel coordinates
    % x2_pixel      homogeneous pixel coordinates
    input_parser
    
    %% RANSAC algorithm preparation
    k = 8;
    s = log(1-p)/log(1-(1-epsilon)^k);
    largest_set_size = zeros(1,1);
    largest_set_dist = inf*ones(1,1);
    largest_set_F = zeros(3,3);   
    
    %% RANSAC algorithm
    % correspondences_robust
    % largest_set_F

    %best_model = null              correspondences_robust
    %best_consensus_set = null      largest_set_F
    %best_error = infinity          largest_set_dist
    set_size = largest_set_size;
    set_dist = largest_set_dist;
    
    
end