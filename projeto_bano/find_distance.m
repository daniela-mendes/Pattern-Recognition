function find_distance(element, regionProps, img)

min = Inf;
max = 0;

for i=1:length(regionProps)
    if i ~= element
        m = [regionProps(element).Centroid(1), regionProps(element).Centroid(2); regionProps(i).Centroid(1), regionProps(i).Centroid(2)];
        element2 = pdist(m,'euclidean');
        if min > element2
            min = element2;
            closest_elem = i;
        end
        if max < element2
            max = element2;
            furthest_elem = i;
        end
    end
end

str = strcat('The closest object is ', {' '}, int2str(closest_elem), ' and the furthest object is', {' '}, int2str(furthest_elem));

plot(regionProps(closest_elem).Centroid(1), regionProps(closest_elem).Centroid(2), 'g+');
plot(regionProps(furthest_elem).Centroid(1), regionProps(furthest_elem).Centroid(2), 'g*');
text(regionProps(closest_elem).Centroid(1)+10, regionProps(closest_elem).Centroid(2)+10, int2str(closest_elem), 'Color', 'green');
text(regionProps(furthest_elem).Centroid(1)+10, regionProps(furthest_elem).Centroid(2)+10, int2str(furthest_elem), 'Color', 'green');
annotation('textbox', [.3 .3 0.7 0.7], 'String', str, 'FitBoxToText','on');