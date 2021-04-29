function CountObjects(image) %flag = 0: count, flag = 1: resto
close all

minArea = 20; % here we set the minimum area of an acceptable region

RGB = imread('Moedas1.jpg'); %trocar input para image
img = rgb2gray(RGB); %keeps only luminance/gray-levels
max(img(:)) %max value of the image; this means that range of gray-level goes from 0 to 255
thr = graythresh(img)*255 %calculate threshold; multiplication by 255 because of the grey-level
bw = img > thr; %binary image, where only the pixels with intensity levels > thr are 'colored' (aka are 1); everything below is zero

%to clean the image, we'll use dilation and then erosion (i.e., closing operation):
se = strel('disk', 7); %strel creates a structuring element, in this case in the shape of a disk
bw2 = imclose(bw, se); %performs cleaning operation over bw

%now, to count the nr. of objects, we need to compute the number of active regions: the CCA algorithm
[lb num] = bwlabel(bw2); %label binary images; lb corresponds to the label matrix and num corresponds to the number of objects

%we need to consider small regions that might not have been removed
regionProps = regionprops(lb, 'Area', 'Centroid', 'Perimeter'); %regionProps has the properties (in this case, the area) of each object/region
inds = find([regionProps.Area] > minArea) %we'll only keep the regions with a meaningful area; inds corresponds to the labels of those regions

sprintf('%s%d', 'The number of objects is ', length(inds))

%now, centroid, perimeter and area
boundaries = bwboundaries(bw2); %boundaries of each region/object, no matter their form

figure; imshow(bw2); hold on %start plot

for i=1:length(inds) %for each of the accepted regions:
    centroid = regionProps(inds(i)).Centroid;
    perimeter = regionProps(inds(i)).Perimeter;
    area = regionProps(inds(i)).Area;
    
    plot(centroid(1), centroid(2), 'r*'); %print centroid in the plot
    plot(boundaries{inds(i)}(:,2),boundaries{inds(i)}(:,1),'Color', rand(1,3),'LineWidth',3); %print perimeter in the plot
    text(centroid(1)-45, centroid(2)+15, strcat('Area: ', num2str(area))); %print area in the plot
    
    sprintf('%s%d%s%d%s%d%s%d%s%d', 'Object with label ', inds(i), ' has centroid in (', centroid(1), ' , ', centroid(2), '), perimeter of ', perimeter, ' and area of ', area) 
end

%figure; hold on %titulo do plot
%subplot(2, 3, 1), imshow(img); title('Original Image (grey scale)'); colormap gray
%subplot(2, 3, 2), imhist(img); hold on; plot(thr, 0, 'r.', 'markersize', 30); title('Histogram and threshold'); drawnow;
%subplot(2, 3, 3), imshow(bw); title('Binary Image after applying otsu threshold'); colormap gray
%subplot(2, 3, 4), imshow(bw2); title('Cleaned regions'); colormap gray
%subplot(2, 3, 6), imshow(bw2); title('After removing small, not meaningful, regions'); colormap gray




