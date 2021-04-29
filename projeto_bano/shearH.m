function shearH(maskedRgbImage)

x = double(input('Insert a value: '));
close all
S = [1 0 0; 
     x 1 0; 
     0 0 1];
 
tformT = affine2d(S);

imgT = imwarp(maskedRgbImage, tformT);
figure(); imshow(imgT);