function translate(maskedRgbImage)

x = double(input('Value to translate in xx: '));
y = double(input('Value to translate in yy: '));
close all
T = [1 0 0; 0 1 0; x y 1];
tformT = affine2d(T);

imgT = imwarp(maskedRgbImage, tformT);
figure(); imshow(imgT);