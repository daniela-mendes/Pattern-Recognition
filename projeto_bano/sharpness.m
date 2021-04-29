function sharpness(img)
close all

% Sharpen filter
highPassFilter = 10*[-1 -1 -1; -1 8 -1; -1 -1 -1];
highPassImage = imfilter(img, highPassFilter);
imgSharpen = img + highPassImage;
figure; imshow(imgSharpen);





