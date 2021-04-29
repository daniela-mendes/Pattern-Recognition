function selectObject(img)
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
% Sharpen croping where clicked

transformOptions = {'Find centroid', 'Find area', 'Find perimeter', 'Find distance', 'Find sharpness', 'Geometric Transformations', 'Heatmap', 'Quit'};
orderOptions = {'Most similar and least similar','From most similar to least similar','Quit'};
while true
    choice = displayMenu(transformOptions);
    %Enter name
    if choice == 1
        element = choose_element(img, regionProps);
        find_centroid(element, regionProps, img);
    elseif choice == 2
        element = choose_element(img, regionProps);
        choice1 = displayMenu(orderOptions);
        if choice1 == 1
            find_area(element, regionProps, img);
        elseif choice1 == 2
            find_order_area(element, regionProps, img);
        else
            break;
        end
    elseif choice == 3
        element = choose_element(img, regionProps);
        choice1 = displayMenu(orderOptions);
        if choice1 == 1
            find_perimeter(element, regionProps, img);
        elseif choice1 == 2
            find_order_perimeter(element, regionProps, img);
        else
            break;
        end
    elseif choice == 4
        element = choose_element(img, regionProps);
        choice1 = displayMenu(orderOptions);
        if choice1 == 1
            find_distance(element, regionProps, img);
        elseif choice1 == 2
            find_order_distance(element, regionProps, img);
        else
            break;
        end
    elseif choice == 5
        element = choose_element(img, regionProps);
        choice1 = displayMenu(orderOptions);
        if choice1 == 1
            find_sharpness(element, img, imgLabel, regionProps);
        elseif choice1 == 2
            find_order_sharpness(element, img, imgLabel, regionProps);
        else
            break;
        end
    elseif choice == 6
        element = choose_element(img, regionProps);
        transformObject(element, regionProps, img);
    elseif choice == 7
        element = choose_element(img, regionProps);
        heatMap(element, regionProps, imgLabel);
    else
        break;
    end
end
