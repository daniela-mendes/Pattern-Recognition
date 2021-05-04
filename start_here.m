stop = true;

fprintf('%s', 'To select an image, write its name as ');
fprintf('''%s''', '<path (optional)>\<name>.<filetype>');
fprintf('\n');

image = input('Please select an image: ');
menu= {'Number of objects and their area, perimeter, centroid', 'Sharpness of objects', 'Order objects in the image', 'Geometrical transformation of an object', 'Exit'};

while stop == true
    for i=1:length(menu)
        fprintf('%d%s%s\n', i, ' - ', menu{i})
    end
    option = input('Menu action: ');
    
    switch option
        case 1
            CountObjects(image)
        case 2
            Sharpness(image)
        case 3
            OrderObjects(image)
        case 4
            TransformObject(image)
        case length(menu)
            stop = false;
        otherwise

    end
    fprintf('\n\n');
end