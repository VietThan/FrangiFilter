function [Dxx, Dyy, Dxy] = Hessian2D(image, scale, neighborhood)
% Function is adapted by Viet Than (viet.than@vanderbilt.edu) (June 2019)
% from function written by D.Kroon University of Twente (June 2009)
% Based on "Multiscale vessel enhancement filtering" by A.F. Frangi, 1998

% Like other image processing filters, the concept is to create a kernel
% with which to apply convolution to the image with.
% A.F.Frangi describes

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