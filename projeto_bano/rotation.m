function rotation(maskedRgbImage)

alfa = double(input('Angle to rotate: '));
close all
R  = [ cos(alfa*pi/180) -sin(alfa*pi/180)  0; 
       sin(alfa*pi/180) cos(alfa*pi/180)   0;
              0                 0          1];
tformT = affine2d(R);

imgT = imwarp(maskedRgbImage, tformT);
figure(); imshow(imgT);