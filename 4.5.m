function [repro_error, x2_repro] = backprojection(correspondences, P1, Image2, T, R, K)
    % This function calculates the mean error of the back projection
    % of the world coordinates P1 from image 1 in camera frame 2
    % and visualizes the correct feature coordinates as well as the back projected ones.
    
    
    N = size(correspondences,2);
    
    % transform the 3D points P1 in cameraframe2, uncalibrated
    P1_2 = bsxfun(@plus, R * P1, T);
    % convert to homo coordinates and backprojection (3-5)
    x2_repro =  K *  P1_2./ P1_2(3,:);
    

    size(x2_repro(1:2,:))
    size(correspondences(3:4,:))
    % Display image2
    figure(1)
    imshow(Image2);
    hold on 
%     correspondences

    % transform correspondences coordinates to Euclidean coordinates
    corr = [correspondences(3:4,:); ones(1,N)];  
    repro_error = 0;
    

    
    % plot all coordinates of correspondences and x2_repro
    for i = 1:N
        
        % x2_repro(1:2,:) respectly correspondences(3:4,:)
        plot(correspondences(3,i), correspondences(4,i), 'r*');
        text(correspondences(3,i), correspondences(4,i), num2str(i), 'Color', 'r'); 
        plot(x2_repro(1,i), x2_repro(2,i), 'g*');
        text(x2_repro(1,i), x2_repro(2,i), num2str(i),'Color', 'g'); 
        
        % calculate Euclidean norm : mean error
        repro_error = repro_error + norm(x2_repro(:,i)-corr(:,i));
    end
%     size(corr)
%     size(x2_repro)

    repro_error = repro_error ./ N;
    
    
    
    
end