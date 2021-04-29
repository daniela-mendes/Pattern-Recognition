function geoTransformations(img)
close all

r=size(img,1);
c=size(img,2);
% 1) get the screensize 
Screen_size = get(0,'ScreenSize');
min_Screen_size = min(Screen_size(3:4));
% 2) imagine the screen as a aquare with this size
% 3) find the length of diagonal
diag_Screen_size =  round(sqrt(2*min_Screen_size.^2));
% 3) Lets say you have to fit a figure which is half the screen size
scale_screen = diag_Screen_size/2;
d=sqrt(r.^2+c.^2);  % find the size of the diagonal of the image 
scale_fig = (scale_screen/d); 

handle = figure;
imagesc(img); colormap gray;
rect_pos_fig = get(gcf,'position');
rect_pos_fig(3) = round(c*scale_fig);
rect_pos_fig(4) = round(r*scale_fig);
% set the figure position so that it is proportional to the image
set(gcf,'Units','pixels')
set(gcf,'position',rect_pos_fig);
% set axis to fill the figure. 
set(gca,'position',[0 0 1 1]);

% create the rectangle
plotedit on
h1=annotation('rectangle',[0  0 0.4 0.4]);
set(h1,'EdgeColor','r','LineStyle','--','LineWidth',2);
% fancy stuff -> slower if image is gray or is too big
if(size(img,3)>1 && scale_fig>1) 
set(h1,'FaceAlpha',.2,'FaceColor','yellow'); 
end
 
% here is the key for resizable rectangle
% set the delete callback
set(gcf,'DeleteFcn',{@myCallback,img,h1});
while true
    w = waitforbuttonpress; 
    switch w 
        case 1 % (keyboard press) 
          key = get(gcf,'currentcharacter'); 
              switch key
                  case 13 % 13 is the return key 
                      close(handle);
                      break
                  otherwise 
                      % Wait for a different command. 
              end
    end
end
waitfor(h1);

function myCallback(src,eventdata,I,h1)
r=size(I,1);
c=size(I,2);
rect_pos = get(h1,'position');
rect_pos = (floor(rect_pos.*[c r c r]))+1;
rect_pos(2) = r - (rect_pos(2) + rect_pos(4));
try
I2=imcrop(I,rect_pos); % uses imageprocessing toolbox
catch
I2=myCrop(I,rect_pos);    
end    
handleB = figure;
imshow(I2); % remove this line if you don't want


transformOptions = {'Translate', 'Rotation', 'Scale', 'Shear Horizontal', 'Shear Vertical', 'Quit'};
while true
    choice = displayMenu(transformOptions);
    %Enter name
    if choice == 1
        translate(I2);
    elseif choice == 2
        rotation(I2);
    elseif choice == 3
        scale(I2);
    elseif choice == 4
        shearH(I2);
    elseif choice == 5
        shearV(I2);
    else
        break;
    end
end