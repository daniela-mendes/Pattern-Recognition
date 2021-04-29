function countObjects(img)
close all

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
regionProps = regionprops(imgLabel, 'Area', 'Centroid', 'BoundingBox', 'Perimeter');

% Center, number of objects, area
numObj = 0;
hold on;
for i=1:length(regionProps)
    if (regionProps(i).Area > 20)
        numObj = numObj + 1;
        plot(regionProps(i).Centroid(1), regionProps(i).Centroid(2), 'r*');
        text(regionProps(i).Centroid(1)+10, regionProps(i).Centroid(2)+10, int2str(i), 'Color', 'red');
        text(regionProps(i).Centroid(1)-40, regionProps(i).Centroid(2)-30, strcat('A : ', int2str(regionProps(i).Area)), 'Color', 'green');
        text(regionProps(i).Centroid(1)-40, regionProps(i).Centroid(2)+30, strcat('P : ', int2str(regionProps(i).Perimeter)), 'Color', 'blue');
        fprintf('For the object %d the area is %d.\n', i, regionProps(i).Area);
    end
end

% circle the perimeter
for b=1:numObj
   plot(boundaries{b}(:,2),boundaries{b}(:,1),'r','LineWidth',1);
end

fprintf('\nThe number of objects present in the image is %d.\n', numObj);