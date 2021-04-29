function relativeDistance(img)
close all

img1 = img(:,:,1);
thr = graythresh(img1)*255;
imgbw = img1 > thr;
imgbw = imfill(imgbw,'holes');
se = strel('disk',3);
imgbw = bwareaopen(imgbw, 20);
erodedbw = imerode(imgbw,se);
[imgLabel, numBlobs] = bwlabel(erodedbw);
boundaries = bwboundaries(imgLabel);
regionProps = regionprops(imgLabel, 'Area', 'Centroid', 'BoundingBox');

% Center, number of objects, area
numObj = 0;
hold on;
for i=1:length(regionProps)
    if (regionProps(i).Area > 20)
        numObj = numObj + 1;
        plot(regionProps(i).Centroid(1), regionProps(i).Centroid(2), 'r*');
        text(regionProps(i).Centroid(1)+10, regionProps(i).Centroid(2)+10, int2str(i), 'Color', 'red');
    end
end

% Relative Distance
refObj = choose_element(img, regionProps);

for i=1:length(regionProps)
    if ((regionProps(i).Area > 20) && (i ~= refObj))
        plot([regionProps(refObj).Centroid(1) regionProps(i).Centroid(1)], [regionProps(refObj).Centroid(2) regionProps(i).Centroid(2)]);
        text(regionProps(i).Centroid(1)+10, regionProps(i).Centroid(2)-15, int2str(sqrt((regionProps(refObj).Centroid(2)-regionProps(i).Centroid(2))^2+(regionProps(refObj).Centroid(1)-regionProps(i).Centroid(1))^2)), 'Color', 'red');
    end
end