function find_order_sharpness(element, img, imgLabel, regionProps)
    close all;
    
    imshow(img);
    
    [B,L] = bwboundaries(imgLabel,'noholes');
    %Display object number
    for i=1:length(regionProps)
        x1 = regionProps(i).Centroid(1);
        y1 = regionProps(i).Centroid(2);
        %define text properties
        t = text(x1,y1,num2str(i));
        t.Color = [1.0 0.0 0.0];
        t.FontSize = 20;
        boundary = B{element};
        b2 = boundary(1:10:length(boundary),:);
        be = diff(b2(:,1));
        bee = diff(be(:,1));
        %figure;plot(bee,'r.','markersize',9);
        %hold on;plot(bee,'r','linewidth',2);
    end
    
    
    %calculate sharpness difference
    listDiff = [];
    listMax = [];
    for i=1:length(regionProps)
        boundary = B{i};
        if i ~= element
            b1 = boundary(1:10:length(boundary),:);
            bx = diff(b1(:,1));
            bxx = diff(bx(:,1));
            element2 = max(bxx);
            listMax = [listMax element2];
            listDiff = [listDiff abs(element2-max(bee))];
        else
            listMax = [listMax max(bee)];
            listDiff = [listDiff 0];
        end
    end
    
    %Show sharpness of the object
    [difference, ind] = sort(listDiff);
    figure;
    for i=1:length(difference)
        subplot(round(sqrt(length(ind))),ceil(sqrt(length(ind))),i);
        imgCrop = imcrop(img, regionProps(ind(i)).BoundingBox);
        imshow(imgCrop);
        if ind(i) == element
            title('*Chosen Object*');
        else
            title(['Sharpness: ' int2str(listMax(ind(i)))]);
        end
    end
end
            
            
            
            