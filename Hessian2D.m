function [Dxx, Dyy, Dxy] = Hessian2D(image, scale, neighborhood)
% Function is adapted by Viet Than (viet.than@vanderbilt.edu) (June 2019)
% from function written by D.Kroon University of Twente (June 2009)
% Based on "Multiscale vessel enhancement filtering" by A.F. Frangi, 1998

% Name: Hessian2D
% Description: create a kernel with which to apply convolution to the image
% based on A.F. Frangi works

% Input: 
%   image           - 2-dimension matrix representation of image
%   scale           - scalar value for scale factor (don't go below 1)
%   neighborhood    - scalar value for local information influence

% Output:
%   Dxx, Dyy, Dxy   - Hessian 2x2 matrix values
%    Hessian matrix:
%       | Dxx  Dxy |
%       |          |
%       | Dxy  Dyy |

if nargin < 2 || neighborhood < 2; end

% Creating a kernel for image filtering
neighborhood = round(neighborhood);
scale = round(scale);
[X,Y]   = ndgrid(scale*neighborhood:scale*neighborhood);
% neighborhood has to be 


% Gaussian second order derivatives
DGaussxx = (X.^2/scale^2 - 1) .* exp(-(X.^2.+Y.^2)/(2*scale^2)) ./ (2*pi*scale^4) ;
DGaussyy = DGaussxx' ;
DGaussxy = X.*Y .* exp(-(X.^2.+Y.^2)/(2*scale^2)) ./ (2*pi*scale^6) ;

Dxx = imfilter(I, DGaussxx, 'conv');
Dyy = imfilter(I, DGaussyy, 'conv');
Dxy = imfilter(I, DGaussxy, 'conv');