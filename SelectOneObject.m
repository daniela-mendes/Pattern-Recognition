function SelectOneObject(regionProps, regionInds, image)

img = imread(image);

imshow(img); hold on; %hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots

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

fprintf('%s%d\n', 'object is ', objectSelected);

end