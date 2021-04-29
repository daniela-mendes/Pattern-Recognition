function [boundaries, regionProps, imgLabel] = prepare_img(img)
close all;

%img1 = rgb2gray(img);
img1 = img(:,:,1);
%imgbw = im2bw(img1, graythresh(img1));
thr = graythresh(img1)*255;
imgbw = img1 > thr;
imgbw = ~bwareaopen(~imgbw, 30);
se = strel('disk',1);	
imgbw = bwareaopen(imgbw, 20);	se = strel('disk',6);
%imgbw = bwareaopen(imgbw, 20);
erodedbw = imerode(imgbw,se);
[imgLabel, numBlobs] = bwlabel(erodedbw);
figure(); imshow(imgLabel);
%figure(); imshow(img);
boundaries = bwboundaries(imgLabel);
regionProps = regionprops(imgLabel, 'Area', 'Centroid', 'BoundingBox');
