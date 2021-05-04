function TransformObject(image)

    img = imread(image);

    while true
        i = imcrop(img);
        answer = questdlg('Which transformation would you like to apply?', 'Possible transformations', 'Scaling', 'Rotation', 'Rotation');

        switch answer
            case 'Rotation'
                figure; imshow(imrotate(i, 180));
            case 'Scaling'
                figure; imshow(imresize(i, 2));
        end

        answer2 = questdlg('Would you like to apply a new transformation?', 'New transformation', 'Yes', 'No', 'No');

        switch answer2
            case 'No'
                break;
            case 'Yes'
                close all;
        end
    end

end