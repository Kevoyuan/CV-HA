function [T, R, lambda, P1, camC1, camC2] = reconstruction(T1, T2, R1, R2, correspondences, K)
    % This function estimates the depth information and thereby determines the 
    % correct Euclidean movement R and T. Additionally it returns the
    % world coordinates of the image points regarding image 1 and their depth information.
    
    %% Preparation from task 4.2
    % T_cell    cell array with T1 and T2 
    % R_cell    cell array with R1 and R2
    % d_cell    cell array for the depth information
    % x1        homogeneous calibrated coordinates
    % x2        homogeneous calibrated coordinates
    preparation
    
    %% R, T and lambda from task 4.3
    % T         reconstructed translation
    % R         reconstructed rotation
    % lambda    depth information
    R_T_lambda
    
    %% Calculation and visualization of the 3D points and the cameras
    N = size(correspondences,2);
    lambda1 = lambda(:,1);
    % Estimated 3D coordinates of P1 of cameraframe1 (3-4)
    P1 = zeros(3, N);
    P1 = bsxfun(@times, lambda1', x1);
    
    figure(1);
    hold on;
    scatter3(P1(1,:), P1(2,:), P1(3,:));
    
    for i=1:N
        % number the 3D coordinates
        text(P1(1,i), P1(2,i), P1(3,i), num2str(i));
    end
    
%     camC1 = zeros(3, 4);
    camC2 = zeros(3, 4);
    % world coordinates of cameraframe1
    camC1 = 0.2 * [-1 1 1 -1;
                    1 1 -1 -1];
    camC1(end+1, :) = 1;
    % calculate world coordinates of cameraframe2 ?
    camC2 = R.' * bsxfun(@minus, camC1, T);
  
    % make square plot
    camC1_plot = [camC1 camC1(:,1)]

    camC2_plot = [camC2 camC2(:,1)]
    
%     figure(2)
    frame1 = plot3(camC1_plot(1,:), camC1_plot(2,:), camC1_plot(3,:), 'b');
    
    grid on;

    frame2 = plot3(camC2_plot(1,:), camC2_plot(2,:), camC2_plot(3,:), 'r');  
    camC1_str = 'Cam1';
    camC2_str = 'Cam2';
    text(camC1_plot(1,1), camC1_plot(2,1), camC1_plot(3,1), camC1_str, 'Color', 'b');
    text(camC2_plot(1,1), camC2_plot(2,1), camC2_plot(3,1), camC2_str, 'Color', 'r');
    axis equal
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    
    campos([43,-22,-87])
    camup([0,-1,0])
    camva('auto')

    
    
    
    
    
end