# CVI
2019/2020 <br>
Group 13 <br>
Miguel Silveira 81984, Henrique Fernandes 87662, Inês Albano 87664

## Requirements
* Matlab 2016+ https://www.mathworks.com/products/matlab.html

     
## Running
The project runs through a menu, in order to run the project correctly, you need to choose the option from the menu.

**Start by hitting run *start_menu.m*.**

The exercises required are in the following function files: 

1. Counting number of object → *countObjects.m*
2. Visualization of the centroid of object → *countObjects.m*
3. Visualization of the perimeter of object → *countObjects.m*
4. Area of object → *countObjects.m*
5. Relative distance between objects → *relativeDistance.m*
6. Sharpness of objects → *sharpness.m*
7. Order objects → *orderObjects.m* is the menu where:
    1. Order by area → *orderArea.m* 
    2. Order by perimeter → *orderPerimeter.m* 
    3. Order by sharpness → *orderSharpness.m* 
8. Compute geometrical transformations based of selection of area → *geoTransformations.m* is the menu where:
    1. Translate transformation → *translate.m* 
    2. Rotation transformation → *rotation.m* 
    3. Scale transformation → *scale.m* 
    4. Shear horizontal transformation → *shearH.m* 
    5. Shear vertical transformation → *shearV.m* 
9. Visualization by interaction → *selectObject.m* is the menu where:
    1. Find centroid of selected object → *find_centroid.m* 
    2. Find area either showing the most/least similar or from the most/least similar.
        1. Show the most/least similar area from the selected object → *find_area.m* 
        2. Show **from** the most/least similar area from the selected object → *find_order_area.m* 
    3. Find perimeter either showing the most/least similar or from the most/least similar.
        1. Show the most/least similar perimeter from the selected object → *find_perimeter.m* 
        2. Show **from** the most/least similar perimeter from the selected object → *find_order_perimeter.m* 
    4. Find distance either showing the closest/furthest or from the closest/furthest.
        1. Show the closest/furthest from the selected object → *find_distance.m* 
        2. Show **from** the closest/furthest similar perimeter from the selected object → *find_order_distance.m* 
    5. Find distance either showing the most/least similar in terms of sharpness or from the most/least similar in terms of sharpness .
        1. Show the most/least similar in terms of sharpness from the selected object → *find_sharpness.m* 
        2. Show **from** the most/least similar in terms of sharpness from the selected object → *find_order_sharpness.m* 
    6. Transform object of selected object → *transformObject.m* 
10. Still in the **selectObject.m** is the menu perform Heatmap of selected object → *heatMap.m*
11. In the **start_menu.m** perform counting money in image → *countMoney.m*
12. In the **start_menu.m** the user needs to input the path of the image they want to interact with.

