%
% Main script for image edge detection
% Author: Viet Than (viet.than@vanderbilt.edu)
%
close all;
clear all;

% Load main t1-weighted MRI
filename = sprintf("data/Leaf_image.jpg"); % make string with file name
image = double(imread(filename));         % read using built-in niftifile
grayImage = rgb2gray(image);
grayImage = 255-grayImage;

[x, y, z] = size(image);
[X,Y] = meshgrid(1:y, 1:x);

figure(1);
[Gx, Gy] = imgradient(grayImage);
imshowpair(Gx,Gy,'montage')
title('Directional Gradients Gx and Gy, Using Sobel Method')

figure(2);
[Gmag, Gdir] = imgradient(grayImage, 'prewitt');
imshowpair(Gmag,Gdir,'montage')
title('Gradient Magnitude, Gmag (left), and Gradient Direction, Gdir (right), using Prewitt method')

