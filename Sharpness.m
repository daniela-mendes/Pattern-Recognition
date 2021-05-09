function Sharpness(regionBoundaries, regionInds, image)
        
    img = imread(image);
    
    for i=1:length(regionInds)
        boundaries = regionBoundaries(regionInds(i)); %o eixo dos x incrementa de forma constante
        boundaries = boundaries(:, 2); %ficamos só com os yy
        gradient = zeros(1,length(boundaries)-1);
        for j=2:length(regionBoundaries(regionInds(i)))
            gradient(1, j-1) = 
        end
        
    end



end


     %thisBoundary = B{k};  % Get k'th boundary
     %x = thisBoundary(:, 2);
     %y = thisBoundary(:, 1);