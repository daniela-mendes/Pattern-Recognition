function scale(maskedRgbImage)

x = double(input('Value to scale in xx (> 0): '));
if x <= 0
    while x <= 0
        x = double(input('Value to translate in xx: '));
    end
end

y = double(input('Value to scale in yy (> 0): '));
if y <= 0
    while y <= 0
        y = double(input('Value to translate in yy: '));
    end
end
close all

S = [x 0 0; 
     0 y 0; 
     0 0 1];
 
tformT = affine2d(S);

imgT = imwarp(maskedRgbImage, tformT);
figure(); imshow(imgT);