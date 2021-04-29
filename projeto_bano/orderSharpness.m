function orderSharpness(regionProps, img, imgLabel)
    close all;
    
    imshow(img);
    %Display object number
    for i=1:length(regionProps)
        %get centroid
        x1 = regionProps(i).Centroid(1);
        y1 = regionProps(i).Centroid(2);
        %define text properties
        t = text(x1,y1,num2str(i));
        t.Color = [1.0 0.0 0.0];
        t.FontSize = 20;
    end
    
    %calculate sharpness
    listSharp =[];
    [B,L] = bwboundaries(imgLabel,'noholes');
    for i=1:length(regionProps)
        boundary = B{i};
        b1 = boundary(1:10:length(boundary),:);
        bx = diff(b1(:,1));
        bxx = diff(bx(:,1));
        listSharp = [listSharp max(bxx)];
        fprintf('The object %d has area: %d and a sharpness value of: %d.\n',i,regionProps(i).Area, max(bxx));
    end
    
    %Show sharpness of the object
    [shrp, ind] = sort(listSharp);
    figure;
    for i=1:length(shrp)
        subplot(round(sqrt(length(shrp))),ceil(sqrt(length(shrp))),i);
        imgCrop = imcrop(img, regionProps(ind(i)).BoundingBox);
        imshow(imgCrop);
        title(['Order: ',int2str(i), '; Sharpness: ' int2str(shrp(i))]);
    end
end