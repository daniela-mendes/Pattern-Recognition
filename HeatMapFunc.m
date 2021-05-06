function HeatMapFunc(regionProps, regionInds, image)

img = imread(image);

n = 0; but = 1;

imshow(img); hold on; %hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots

while (but == 1) %button = 1 means we are left-clicking the mouse
    [col, lin, but] = ginput(1); %ginput to identify the coordinates of 1 point by moving the cursor to the desired location and clicking on it; to stop, press Return key
    if (but == 1)
        n = n+1;
        cp(n) = col; %x-coordinate 'array'
        lp(n) = lin; %y-coordinate 'array'
        plot(col, lin, 'r.', 'MarkerSize', 18); drawnow; % red dots of size 18
    end
end

end