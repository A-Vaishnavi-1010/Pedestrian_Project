%image subtraction and correlation to detect motion

clc;
clear all;
close all;
    %read video file
    video = VideoReader('media\People.mp4');
    
    video.currentTime = 7;
    I = readFrame(video);
    imwrite(I,"media\People_f7.png");
    video.currentTime = 11;
    I = readFrame(video);
    imwrite(I,"media\People_f11.png");
    
    
I1 = imread("media\People_f7.png");
I2 = imread("media\People_f11.png");
[m,n] = size(I2);
f = imread("media\People_f.png");

for i = 1:m
    for j = 1:1280
        for k = 1:3
            I3(i,j,k) = max(I2(i,j,k)-I1(i,j,k),I1(i,j,k)-I2(i,j,k));
        end
    end
end
t = rgb2gray(I3);
k = rgb2gray(f);
I4 = 0.000000005 * xcorr2(t,k);

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
title("correlation");
figure;
imshow(f);
title("filter");