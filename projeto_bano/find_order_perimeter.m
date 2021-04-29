function find_order_perimeter(element, regionProps, img)

    listDiff = [];
    listPerim = [];
    for i=1:length(regionProps)
        if i ~= element
            listPerim = [listPerim regionProps(i).Perimeter];
            listDiff = [listDiff abs(regionProps(i).Perimeter - regionProps(element).Perimeter)];
        else
            listPerim = [listPerim regionProps(element).Perimeter];
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
            title(['Order: ',int2str(i), '; Perimeter: ' int2str(listPerim(ind(i)))]);
        end       
    end   
end