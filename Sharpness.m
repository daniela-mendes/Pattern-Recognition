function Sharpness(regionBoundaries, regionInds, image)
        
    img = imread(image);
    
    f = figure;
    p = uipanel('Parent',f,'BorderType','none'); 
    p.Title = 'Sharpness of each object'; 
    p.TitlePosition = 'centertop'; 
    p.FontSize = 12;
    p.FontWeight = 'bold'; hold on
    
    for i=1:length(regionInds)
        boundaries = regionBoundaries{regionInds(i)};
        x_boundaries = boundaries(:, 2);
        y_boundaries = boundaries(:, 1);

        gradient = zeros(1,length(boundaries)-1); % VER TAMANHO DO VETOR
        counter = 1;
        for j=11:10:length(boundaries)
            if x_boundaries(j) == x_boundaries(j-10)
                gradient(1, counter) = 0;
            else
                gradient(1, counter) = (y_boundaries(j)-y_boundaries(j-10))/(x_boundaries(j)-x_boundaries(j-10));
            end
            counter = counter + 1;
        end
        
        gradient = gradient(1, 1:counter-1);
        
        %soma = 0;
        gradient2 = zeros(1,length(gradient)-1);
        for j=2:length(gradient)
            gradient2(1, j-1) = abs(gradient(j)-gradient(j-1)); 
            %soma = soma + gradient2(1, j-1);
        end
        
        subplot(2, ceil(length(regionInds)/2), i, 'Parent', p), plot([1:length(gradient)], gradient, 'b*-'); title(strcat('Obj: ', num2str(i)));
        
    end

end