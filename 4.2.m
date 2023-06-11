function [T_cell, R_cell, d_cell, x1, x2] = reconstruction(T1, T2, R1, R2, correspondences, K)
    %% Preparation
    T_cell = {T1, T2, T1, T2};
    R_cell = {R1, R1, R2, R2};
    
    x1 = correspondences(1:2, :);
    x2 = correspondences(3:4, :);
    % convert to homo
    x1(end+1, :) = 1;
    x2(end+1, :) = 1;
    
    % Epipolar equation for calibrated cameras
    x1 = inv(K) * x1;
    x2 = inv(K) * x2;
    
    % initialize d_cell for 4 variances
    N = size(correspondences,2);
    d_cell = {zeros(N,2),zeros(N,2),zeros(N,2),zeros(N,2)};
    
        
    
    
end