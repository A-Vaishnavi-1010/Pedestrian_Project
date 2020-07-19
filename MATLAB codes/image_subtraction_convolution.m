%Image subtraction and convolution to detect motion

clc;
clear all;
close all;
I1 = imread("C:\Users\lenovo\Pictures\Camera Roll\WIN_20200306_11_39_28_Pro.jpg");
I2 = imread("C:\Users\lenovo\Pictures\Camera Roll\WIN_20200306_11_39_32_Pro.jpg");

[m,n] = size(I2);
f = imread("C:\Users\lenovo\Pictures\Camera Roll\WIN_20200306_11_19_03_Pro.jpg");
for i = 1:720
    for j = 1:1280
        for k = 1:3
            I3(i,j,k) = max(I2(i,j,k)-I1(i,j,k),I1(i,j,k)-I2(i,j,k));
        end
    end
end
I4 = 0.000000005 * convn(I3,f,'same');

figure;
subplot 223
imshow(I3);
title("I2-I1");
subplot 222
imshow(I2);
title("2nd");
subplot 221
imshow(I1);
title("1st");
subplot 224
imshow(I4);
title("convolution");
figure;
imshow(f);
title("filter");