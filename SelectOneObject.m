function SelectOneObject(regionProps, regionInds, image)

img = imread(image);

imshow(img); title('Select object and then choose, in the Command Window, the similarity criteria'); hold on; %hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots

[col, lin, but] = ginput(1); %ginput to identify the coordinates of 1 point by moving the cursor to the desired location and clicking on it; to stop, press Return key

%calculate euclidian distance to find centroid of selected object
objectSelected = regionInds(1); %objectSelected is the index of the selected object in regionProps; at first the selected object is the first one in regionProps
dist = sqrt((col - (regionProps(regionInds(1)).Centroid(1))).^2 + (lin - (regionProps(regionInds(1)).Centroid(2))).^2);

%now, we will compare the distance from [col, lin] to every centroid
for i=2:length(regionInds)
    tmp = sqrt((col - (regionProps(regionInds(i)).Centroid(1))).^2 + (lin - (regionProps(regionInds(i)).Centroid(2))).^2);
    if (tmp < dist) %if dist to this centroid is smaller than the previous smaller distance
        dist = tmp;
        objectSelected = regionInds(i);
    end
end

cont = true;

menu = {'Similarity according to centroids (closest to furthest)', 'Similarity according to perimeter (most similar to least similar)', 'Similarity according to area (most similar to least similar)', 'Similarity according to sharpness (most similar to least similar)', 'Go back to menu'};

while cont == true
    fprintf('\n');
    for i=1:length(menu)
        fprintf('%d%s%s\n', i, ' - ', menu{i})
    end
    
    option = input('Choose a criteria: ');
    
    switch option
        case 1
            centroid_x = regionProps(objectSelected).Centroid(1);
            centroid_y = regionProps(objectSelected).Centroid(2);
            
            %centrInds = zeros(1, length(regionInds));
            centrDist = zeros(1, length(regionInds));
            
            for i=1:length(regionInds) %for loop to calculate distance from our selected object to every other centroid
                %centrInds(i) = regionInds(i);
                centrDist(i) = sqrt((centroid_x - (regionProps(regionInds(i)).Centroid(1))).^2 + (centroid_y - (regionProps(regionInds(i)).Centroid(2))).^2);
            end
            
            [centrDist, idx] = sort(centrDist);

            inds = regionInds(idx);

            for i=1:length(inds)
                j = imcrop(img, regionProps(inds(i)).BoundingBox);
                if i == 1
                    subplot(1, length(inds), i), imshow(j); title({['Selected']
                    ['Object']});
                else
                    subplot(1, length(inds), i), imshow(j); title({['Distance: ']
                    [num2str(centrDist(i))]});
                end
                hold on
            end
            
            hold off;
            
        case 2
            %delete(gcf);
            perim = regionProps(objectSelected).Perimeter;
            
            perimeters = zeros(1, length(regionInds));
            

            for i=1:length(regionInds)
                perimeters(1, i) = abs((regionProps(regionInds(i)).Perimeter) - perim);
            end

            [perimeters, idx] = sort(perimeters);

            inds = regionInds(idx);

            for i=1:length(inds)
                j = imcrop(img, regionProps(inds(i)).BoundingBox);
                if i == 1
                    subplot(1, length(inds), i), imshow(j); title({['Selected']
                    ['Object']}); %['Perimeter: '][num2str(regionProps(inds(i)).Perimeter)]
                else
                    subplot(1, length(inds), i), imshow(j); title({['Perimeter: ']
                    [num2str(regionProps(inds(i)).Perimeter)]});
                end
                hold on
            end

            hold off;
        
        case 3
            
        case 4
            
        case 5
            cont = false;
            break;
    end

end