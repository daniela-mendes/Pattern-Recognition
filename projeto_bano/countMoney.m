function countMoney(img)
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
regionProps = regionprops(imgLabel, 'Area', 'Centroid', 'Extent', 'BoundingBox');

% Filter coins
minExtent = 0.75;
keepMask = [regionProps.Extent]>minExtent;
imgbw = ismember(imgLabel, find(keepMask));

img3 = rgb2hsv(img);
amount = 0;
for i=1:length(regionProps)
    x = regionProps(i).Centroid(1);
    y = regionProps(i).Centroid(2);
    pixels = impixel(img3,x,y);
    if pixels(1) >= 0.0519 && pixels(1) <= 0.1537 
        if regionProps(i).Area >= 8000 & regionProps(i).Area < 9000
            amount = amount + 0.01;
        elseif regionProps(i).Area >= 11500 & regionProps(i).Area < 12500
            amount = amount + 0.02;
        elseif regionProps(i).Area >= 15000 & regionProps(i).Area < 16000
            amount = amount + 0.05;
        elseif regionProps(i).Area >= 12500 & regionProps(i).Area < 13500
            amount = amount + 0.1;
        elseif regionProps(i).Area >= 16500 & regionProps(i).Area < 17500
            amount = amount + 0.2;
        elseif regionProps(i).Area >= 19500 & regionProps(i).Area < 20500
            amount = amount + 0.5;
        elseif regionProps(i).Area >= 18000 & regionProps(i).Area < 19000
            amount = amount + 1;
        end
    end
end

am = ['The amount of money in this image is: ' num2str(amount)];
txt = insertText(img, [size(img, 1)/3 1/2], am, 'FontSize', 24);
figure('Name', sprintf('The amount of money in this image is: %0.2f €\n', amount));
imshow(txt);
