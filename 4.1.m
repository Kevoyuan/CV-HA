function [T1, R1, T2, R2, U, V] = TR_from_E(E)
    % This function calculates the possible values for T and R 
    % from the essential matrix
    [U,S,V] = svd(E);

    if det(U) ~= 1
        U = U * diag([1,1,-1]);
    end
%     if det(V) ~= 1
%         V = V * diag([1,1,-1]);
%     end
  
    % rotation matrix by z-axis
    Rz1 = [0 -1 0;
        1 0 0;
        0 0 1];
    Rz2 = [0 1 0;
        -1 0 0;
        0 0 1];
    % rotation matrix and transformation matrix
    R1 = U * Rz1' * V';
    T1_hat = U * Rz1 * S * U';
    
    R2 = U * Rz2' * V';
    T2_hat = U * Rz2 * S * U';
    
    % convert hat matrix 
    T1 = [T1_hat(3,2); T1_hat(1,3); T1_hat(2,1)];
    T2 = [T2_hat(3,2); T2_hat(1,3); T2_hat(2,1)];
    
    
    
end