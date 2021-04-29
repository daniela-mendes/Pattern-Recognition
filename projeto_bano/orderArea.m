function orderArea(regionProps,img, numObj)

% Order images
coinsArea = sort([regionProps.Area]);
countOrder = 1;
for a=1:length(coinsArea)
    for i=1:numObj
        if (regionProps(i).Area == coinsArea(a))
            coinBoundingBox = regionProps(i).BoundingBox;
            imgCrop = imcrop(img, coinBoundingBox);
            imgCrop = insertText(imgCrop, [size(imgCrop,1)/2 size(imgCrop,2)/2], countOrder);
            figure(); imshow(imgCrop);
            countOrder = countOrder + 1;
        continue;
        end       
    end   
end