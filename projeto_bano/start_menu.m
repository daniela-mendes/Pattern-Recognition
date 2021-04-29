%clear all

%TODO: 
%1-Sharpness colocar pontos num array em relação a X e ver variações
%abruptas de valores, quanto mais abruptas(angulo +agudo) maior valor de edge .
%3-Ordenacao das imagens por sharpness

menuItems = {'Object number, Area and Perimeter','Distance Between Objects','Sharpness','Order Images','See Original Image', 'Amount of Money', 'Geometric Transformation', 'Select Individual Object', 'Quit'};
path = choosePath('Please specify the path to the image: ');

img = imread(path);

while true
    %display menu  
    choice = displayMenu(menuItems);
    
    %Enter name
    if choice == 1
        countObjects(img);
    elseif choice == 2
        relativeDistance(img);
    elseif choice == 3
        sharpness(img);
    elseif choice == 4
        orderObjects(img);
    elseif choice == 5
        showImage(img);
    elseif choice == 6
        countMoney(img);
    elseif choice == 7
        geoTransformations(img);
    elseif choice == 8
        selectObject(img);
    else
        break;
    end
end