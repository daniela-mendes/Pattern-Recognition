function orderObjects(img)
close all

img1 = img(:,:,1);
thr = graythresh(img1)*255;
imgbw = img1 > thr;
imgbw = ~bwareaopen(~imgbw, 30);
se = strel('disk',1);	
imgbw = bwareaopen(imgbw, 20);	se = strel('disk',6);
erodedbw = imerode(imgbw,se);
[imgLabel, numBlobs] = bwlabel(erodedbw);
boundaries = bwboundaries(imgLabel);
regionProps = regionprops(imgLabel, 'Area', 'Centroid', 'BoundingBox', 'Perimeter');
numObj = length(regionProps);

transformOptions = {'Order by area', 'Order by perimeter', 'Order by sharpness', 'Quit'};
while true
    choice = displayMenu(transformOptions);
    %Enter name
    if choice == 1
        orderArea(regionProps, img, numObj);
    elseif choice == 2
        orderPerimeter(regionProps, img, numObj);
    elseif choice == 3
        orderSharpness(regionProps, img, imgLabel);
    else
        break;
    end
end