function element = choose_element(img, regionProps)
close all;

imshow(img);
hold on;
img1 = img(:,:,1);
thr = graythresh(img1)*255;
imgbw = img1 > thr;
imgbw = ~bwareaopen(~imgbw, 30);
se = strel('disk',1);	
imgbw = bwareaopen(imgbw, 20);	se = strel('disk',6);
erodedbw = imerode(imgbw,se);
[x, y] = ginput(1);
pixels = impixel(erodedbw,x,y);

while pixels == [0,0,0]
    [x, y] = ginput(1);
    pixels = impixel(erodedbw,x,y);
end

plot(x, y, 'r*');

% Order images
m = [x, y; regionProps(1).Centroid(1), regionProps(1).Centroid(2)];
min_dist = pdist(m,'euclidean');
chosen = regionProps(1);
j = 1;
for i=2:length(regionProps)
    if ((regionProps(i).Area > 20))
        m = [x, y; regionProps(i).Centroid(1), regionProps(i).Centroid(2)];
        min_dist_aux = pdist(m,'euclidean');
        if min_dist > min_dist_aux
            min_dist = min_dist_aux;
            chosen = regionProps(i);
            j = i;
        end
    end
end
element = j;


