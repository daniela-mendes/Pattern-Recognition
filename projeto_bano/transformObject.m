function transformObject(element, regionProps, img)

coinBoundingBox = regionProps(element).BoundingBox;
croppedImg = imcrop(img, coinBoundingBox);

transformOptions = {'Translate', 'Rotation', 'Scale', 'Shear Horizontal', 'Shear Vertical', 'Quit'};
while true
    choice = displayMenu(transformOptions);
    %Enter name
    if choice == 1
        translate(croppedImg);
    elseif choice == 2
        rotation(croppedImg);
    elseif choice == 3
        scale(croppedImg);
    elseif choice == 4
        shearH(croppedImg);
    elseif choice == 5
        shearV(croppedImg);
    else
        break;
    end
end