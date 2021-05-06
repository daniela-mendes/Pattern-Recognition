stop = true;

imageMenu = {'Moedas1.jpg', 'Moedas2.jpg', 'Moedas3.jpg', 'Moedas4.jpg'};
menu= {'Number of objects and their area, perimeter, centroid', 'Sharpness of objects', 'Order objects in the image', 'Geometrical transformation of an object', 'Select ONE object', 'Heat Map', 'Quantity of money', 'Exit'};

while stop == true
    for i=1:length(imageMenu)
        fprintf('%d%s%s\n', i, ' - ', imageMenu{i})
    end
    fprintf('%d%s%s\n', length(imageMenu)+1, ' - ', 'Chose a new path/image');
    fprintf('%d%s%s\n', length(imageMenu)+2, ' - ', 'Exit');

    image = input('Please select an image: ');
    switch image
        case 1
            image = imageMenu{1};
        case 2
            image = imageMenu{2};
        case 3
            image = imageMenu{3};
        case 4
            image = imageMenu{4};
        case length(imageMenu)+1
            fprintf('%s', 'To select an image, write its name as ');
            fprintf('''%s''', '<path (optional)>\<name>.<filetype>');
            fprintf('\n');
            image = input('Path and/or image: ');
        case length(imageMenu)+2
            stop = false;
        %otherwise
            %image =input('Wrong input, please try again: ');
    end
    
   if stop == true
        for i=1:length(menu)
            fprintf('%d%s%s\n', i, ' - ', menu{i})
        end
        option = input('Menu action: ');

        switch option
            case 1
                [regionProps, inds] = CountObjects(image)
            case 2
                Sharpness(image)
            case 3
                OrderObjects(image)
            case 4
                TransformObject(image, boundaries{inds(1)})
            case 5
                [regionProps, boundaries, inds] = CountObjects(image)
                SelectOneObject(regionProps, inds, image)
            case 6
                [regionProps, boundaries, inds] = CountObjects(image)
                HeatMapFunc(regionProps, inds, image)
            case 7
                [regionProps, boundaries, inds] = CountObjects(image)
                CountMoney(regionProps, boundaries, inds, image)
            case length(menu)
                stop = false;
            otherwise

        end
    end
    fprintf('\n\n');
end