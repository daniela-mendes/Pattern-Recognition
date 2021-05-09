function Sharpness(regionBoundaries, regionInds, image)
        
    img = imread(image);
    
    for i=1:length(regionInds)
        boundaries = regionBoundaries{regionInds(i)};
        x_boundaries = boundaries(:, 2);
        y_boundaries = boundaries(:, 1);

        gradient = zeros(1,length(boundaries)-1);
        
        for j=2:length(boundaries)
            if x_boundaries(j) == x_boundaries(j-1)
                gradient(1, j-1) = 0;
            else
                gradient(1, j-1) = (y_boundaries(j)-y_boundaries(j-1))/(x_boundaries(j)-x_boundaries(j-1));
            end
        end
        
        gradient2 = zeros(1,length(boundaries)-2);
        for j=2:length(boundaries)-1
            gradient2(1, j-1) = abs(gradient(j)-gradient(j-1)); 
        end
        
        figure, scatter([1:length(gradient2)], gradient2, 'filled')
        
        %plot(1, length(gradient), j-1), imshow(scatter(delta_x(1, j-1), gradient(1, j-1)));
        
    end

end