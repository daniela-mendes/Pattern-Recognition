function I2 = myCrop(I,rect)
% copied from imcrop -> see IMCROP
m = size(I,1);
n = size(I,2);
pixelHeight = rect(4);
pixelWidth = rect(3);
r1 = round(rect(2) + 1 );
c1 = round(rect(1) + 1 );
r2 = round(rect(4) + r1);
c2 = round(rect(3) + c1);
% Check for selected rectangle completely outside the image
if ((r1 > m) || (r2 < 1) || (c1 > n) || (c2 < 1))
    b = [];
else
    r1 = max(r1, 1);
    r2 = min(r2, m);
    c1 = max(c1, 1);
    c2 = min(c2, n);
    I2 = I(r1:r2, c1:c2, :);
end
return I2;