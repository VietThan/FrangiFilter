%
% Interpolation with leaf
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


xv = X(:);
yv = Y(:);
zv = grayImage(:);

f = scatteredInterpolant(xv, yv, zv);

% Nearest
figure(1);
plot3(X, Y, grayImage, 'mo');
% stem3(X, Y,grayImage,'MarkerFaceColor','g')
hold on
% surf(X, Y, grayImage, 'FaceAlpha', 0, 'EdgeColor', 'interp');
f.Method = 'nearest';
Z1 = f(X,Y);
% figure(2);
mesh(X,Y,Z1);


zlim([254.1, 255.1]);
title('Nearest Neighbor');
legend('Sample Points','Interpolated Surface','Location','NorthWest')


% Linear
figure(2);
plot3(X, Y, grayImage, 'mo');
hold on
f.Method = 'linear';
Z2 = f(X,Y);
mesh(X,Y,Z2);

zlim([254.1, 255.1]);
title('Linear');
legend('Sample Points','Interpolated Surface','Location','NorthWest')

% Exact
figure(3);
plot3(X, Y, grayImage, 'mo');
hold on
f.Method = 'natural';
Z3 = f(X,Y);
mesh(X,Y,Z3);

zlim([254.1, 255.1]);
title('Natural Neighbor');
legend('Sample Points','Interpolated Surface','Location','NorthWest')

