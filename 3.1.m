function [x1, x2, A, V] = epa(correspondences, K)
    % Depending on whether a calibrating matrix 'K' is given,
    % this function calculates either the essential or the fundamental matrix
    % with the eight-point algorithm.
    if nargin == 1      % no K input
        x1 = [];
        x1(1:2,:) = correspondences(1:2,:);
        x1(3,:) = ones(1,size(x1,2));
        x2 = [];
        x2(1:2,:) = correspondences(3:4,:);
        x2(3,:) = ones(1,size(x2,2));
        for i = 1:size(x1,2)
            A(i,:) = kron(x1(:,i),x2(:,i))';   
        end    
        [~,~,V] = svd(A);        
    end
    if nargin == 2      % with K input
        x1 = [];
        x1(1:2,:) = correspondences(1:2,:);
        x1(3,:) = ones(1,size(x1,2));
        x1 = inv(K)*x1;
        x2 = [];
        x2(1:2,:) = correspondences(3:4,:);
        x2(3,:) = ones(1,size(x2,2));
        x2 = inv(K)*x2;
        for i = 1:size(x1,2)
            A(i,:) = kron(x1(:,i),x2(:,i))';   
        end    
        [~,~,V] = svd(A); 
    end

    
end