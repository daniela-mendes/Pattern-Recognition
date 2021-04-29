function find_order_area(element, regionProps,img)

    listDiff = [];
    listArea = [];
    for i=1:length(regionProps)
        if i ~= element
            listArea = [listArea regionProps(i).Area];
            listDiff = [listDiff abs(regionProps(i).Area - regionProps(element).Area)];
        else
            listArea = [listArea regionProps(element).Area];
            listDiff = [listDiff 0];
        end
    end

    [diffs, ind] = sort(listDiff);
    figure();
    for i=1:length(diffs)
        subplot(round(sqrt(length(regionProps))),ceil(sqrt(length(regionProps))),i);
        coinBoundingBox = regionProps(ind(i)).BoundingBox;
        imgCrop = imcrop(img, coinBoundingBox);
        imshow(imgCrop);
        if ind(i) == element
            title('*Chosen Object*');
        else
            title(['Order: ',int2str(i), '; Area: ' int2str(listArea(ind(i)))]);
        end       
    end   
end