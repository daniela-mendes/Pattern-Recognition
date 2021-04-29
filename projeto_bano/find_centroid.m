function find_centroid(element, regionProps, imgLabel)

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

plot(regionProps(closest_elem).Centroid(1), regionProps(closest_elem ).Centroid(2), 'g+');
plot(regionProps(furthest_elem).Centroid(1), regionProps(furthest_elem).Centroid(2), 'g*');