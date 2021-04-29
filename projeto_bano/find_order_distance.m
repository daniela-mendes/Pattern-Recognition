function find_order_distance(element, regionProps, img)

    Listdist = [];
    for j=1:length(regionProps)
        if j ~= element
            Listdist(j) = sqrt((regionProps(element).Centroid(2)-regionProps(j).Centroid(2))^2+(regionProps(element).Centroid(1)-regionProps(j).Centroid(1))^2);
        else
            Listdist(j)= 0;
        end
    end

    [dist, ind] = sort(Listdist);
    figure;
    for i=1:length(dist)
        subplot(round(sqrt(length(dist))),ceil(sqrt(length(dist))),i);
        coinBoundingBox = regionProps(ind(i)).BoundingBox;
        imgCrop = imcrop(img, coinBoundingBox);
        imshow(imgCrop);
        if ind(i) == element
            title('*Chosen Object*');
        else
            title(['Order: ',int2str(i), '; Distance: ' int2str(dist(i))]);
        end       
    end