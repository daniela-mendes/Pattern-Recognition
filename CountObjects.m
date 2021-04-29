function CountObjects(image)
close all, clear all

RGB = imread('Moedas2.jpg'); %trocar input para image
img = rgb2gray(RGB); %keeps only luminance/gray-levels
figure; imshow(img);
%figure; imhist(img(:)); hold on
max(img(:)) %max value of the image; this means that range of gray-level goes from 0 to 255
thr = graythresh(img)*255 %calculate threshold; multiplication by 255 because of the grey-level
bw = img > thr; %binary image, where only the pixels with intensity levels > thr are 'colored' (aka are 1); everything below is zero
figure; imshow(bw);

%to clean the image, we'll use dilation and then erosion (i.e., closing operation):
se = strel('disk', 7); %strel creates a structuring element, in this case in the shape of a disk
bw2 = imclose(bw, se); %performs cleaning operation over bw
figure; imshow(bw2); %we cleaned the coin regions

%now, to count the nr. of objects, we need to compute the number of active regions: the CCA algorithm
[lb num] = bwlabel(bw2); %label binary images; lb corresponds to the label matrix and num corresponds to the number of objects
figure; imshow(mat2gray(lb)); title('Labels'); colormap(hot(num))

%we need to consider small regions that might not have been removed
regionProps = regionprops(lb, 'Area'); %regionProps has the properties (in this case, the area) of each object/region
inds = find([regionProps.Area] > 20) %we'll only keep the regions with a meaningful area; inds corresponds to the labels of those regions

sprintf('%s%d', 'The number of objects is ', length(inds))


