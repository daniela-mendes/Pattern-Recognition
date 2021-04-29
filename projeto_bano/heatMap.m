function heatMap(element, regionProps, img)

Matrix = img;

%melhorar ciclo
for row = 1:size(Matrix,1)
    for col = 1:size(Matrix,2)
        m = sqrt((regionProps(element).Centroid(1)-col)^2+(regionProps(element).Centroid(2)-row)^2);
        Matrix(row,col) = floor(m);
    end
end

figure;imagesc(Matrix);colormap('hot');
colorbar('EastOutside');
