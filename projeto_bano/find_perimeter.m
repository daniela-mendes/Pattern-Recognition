function find_perimeter(element, regionProps, img)

element_perimeter = regionProps(element).Perimeter;
if element ~= 1
    element1 = regionProps(1).Perimeter;
    sim_element = 1;
    dif_element = 1;
else
    element1 = regionProps(2).Perimeter;
    sim_element = 2;
    dif_element = 2;
end


for i=1:length(regionProps)
    if i ~= element
        element2 = regionProps(i).Perimeter;
        if abs(element_perimeter - element1) > abs(element_perimeter - element2)
            sim_element = i;
        end
        if abs(element_perimeter - element1) < abs(element_perimeter - element2)
            dif_element = i;
        end
    end
end

str = strcat('Most similar object is ', {' '}, int2str(sim_element), ' and the least similar object is', {' '}, int2str(dif_element));

plot(regionProps(sim_element).Centroid(1), regionProps(sim_element ).Centroid(2), 'g+');
plot(regionProps(dif_element).Centroid(1), regionProps(dif_element).Centroid(2), 'g*');
text(regionProps(sim_element).Centroid(1)+10, regionProps(sim_element).Centroid(2)+10, int2str(sim_element), 'Color', 'green');
text(regionProps(dif_element).Centroid(1)+10, regionProps(dif_element).Centroid(2)+10, int2str(dif_element), 'Color', 'green');
annotation('textbox', [.3 .3 0.7 0.7], 'String', str, 'FitBoxToText','on');