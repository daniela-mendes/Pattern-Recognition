function find_sharpness(element, img, imgLabel, regionProps)
    close all;
    min_val = 0;
    diff_min = 100;
    diff_max = 0;
    max_val = 0;
    
    figure;imshow(img);
    
    [B,L] = bwboundaries(imgLabel,'noholes');
    %Display object number
    for i=1:length(regionProps)
        %get centroid
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
    figure;plot(bee,'r','linewidth',2)

    %calculate sharpness
    for i=1:length(regionProps)
        boundary = B{i};
        if i ~= element
            b1 = boundary(1:10:length(boundary),:);
            bx = diff(b1(:,1));
            bxx = diff(bx(:,1));
            element2 = max(bxx);
            if diff_min > abs(element2-max(bee))
                diff_min = abs(element2-max(bee));
                min_val = element2;
                closest_elem = i;
            end
            if diff_max < abs(element2-max(bee))
                diff_max = abs(element2-max(bee));
                max_val = element2;
                furthest_elem = i;
            end
        end
    end
    
    %Chosen Element
    subplot(1,3,1);
    coinBoundingBox = regionProps(element).BoundingBox;
    imgCrop = imcrop(img, coinBoundingBox);
    imshow(imgCrop);
    title(['*Chosen* ', '; Sharpness: ' int2str(max(bee))]);
    %Closest Element
    subplot(1,3,2);
    coinBoundingBox = regionProps(closest_elem).BoundingBox;
    imgCrop = imcrop(img, coinBoundingBox);
    imshow(imgCrop);
    title(['Closest: ', int2str(closest_elem), '; Sharpness: ' int2str(min_val)]);
    %Furthest Element
    subplot(1,3,3);
    coinBoundingBox = regionProps(furthest_elem).BoundingBox;
    imgCrop = imcrop(img, coinBoundingBox);
    imshow(imgCrop);
    title(['Furthest: ', int2str(furthest_elem), '; Sharpness: ' int2str(max_val)]);
    %fprintf('The object %d is the element with %d of sharpness.\n',element, max(bee));
    %fprintf('The object %d is the closest with %d of sharpness.\n',closest_elem, min_val);
    %fprintf('The object %d is the furthest with %d of sharpness.\n',furthest_elem, max_val);

end
            
            
            
            