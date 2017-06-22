function [t R T] = zhangsExt(K,H)


%% Extrinsic Parameters Estimation

% Tz Sign fixing

     if (det(H) > 0)        
  H(1:3,:) = -H(1:3,:);
    end

 

% Rotation Matirx Estimation

 lambda1 = 1/norm(inv(K)*H(:,1));

 lambda2 = 1/norm(inv(K)*H(:,2));

 lambda3 = (lambda1 + lambda2)/2;

    

 r1 = lambda1*inv(K)*H(:,1);

 r2 = lambda2*inv(K)*H(:,2);

 r3 = cross(r1,r2);

 

 % Orthogonality Enforcement

 R_temp = [r1 r2 r3];

 [svdU,svdD,svdV] = svd(R_temp);
Rmat=svdU*eye(3,3)*svdV';
 R = Rodrigues(Rmat) *180/pi;

    

 % Translation Vector Estimation

 t = lambda3*inv(K)*H(:,3);
 T = [Rmat t;0 0 0 1]
