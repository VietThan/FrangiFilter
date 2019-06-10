function [Lambda1,Lambda2,Ix,Iy]=eig2image(Dxx,Dxy,Dyy)
% Function is adapted by Viet Than (viet.than@vanderbilt.edu) (June 2019)
% from function written by D.Kroon University of Twente (June 2009)
% Based on "Multiscale vessel enhancement filtering" by A.F. Frangi, 1998

% Name: eig2image
% Description: Calculate the eigenvalue from the provided Hessian matrix.
% Theoretically the smaller eigenvalue 
 
% Input:
%   Dxx, Dyy, Dxy       - values in Hessian matrix
%    Hessian matrix:
%       | Dxx  Dxy |
%       |          |
%       | Dxy  Dyy |

% Output:
%   Lambda1     - smaller eigenvalue by absolute value
%   Lambda2     - bigger eignvalue by absolute value
%   Ix          - vector corresponding to smaller eigenvalue
%   Iy          - vector corresponding to larger eigenvalue

% Compute the eigenvectors
tmpVal = ((Dxx - Dyy).^2 + 4*Dxy.^2).^(1/2);
v1x = (1/2*(Dxx + Dyy - tmpVal) - Dyy)./Dxy;
v2x = (1/2*(Dxx + Dyy + tmpVal) - Dyy)./Dxy;