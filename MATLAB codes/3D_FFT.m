%3D FFT method is applied to detect motion

clc;
clear all;
close all;
%read video file
video = VideoReader('media\People.mp4');
    
video.currentTime = 3;
%T= video.NumberOfFrames  ;          %number of frames
frameHeight = video.Height;          %frame height
frameWidth = video.Width ;           %frameWidth
get(video);                          %return graphics properties of video
i=1;
for t=3:13
    f0(:,:,:,i)= readFrame(video); 
    f1=f0(:,:,:,i);
    f2=rgb2gray(f1);                 %convert colour frame into gray
    I(:,:,i)=f2;
    i=i+1;
    video.currentTime = t+1;
end

%Take the 3-D Fourier Transform
f=fftn(f0);
%f=fftn(I);
%plot(f(:,:,7))
   
%Get the phase spectrum
phase=angle(f);
    
%Reconstrut frames by applying 3-D Inverse Fourier Transform on phase spectrum only
reconstruct  = (ifftn(f));
%reconstruct=(ifftn(exp(1*j*phase)));
    
for m=1:i-1
    reconstruct(:,:,:,m)=abs(reconstruct(:,:,:,m));
    %reconstruct(:,:,m) = abs(reconstruct(:,:,m));
    figure,
    subplot(1,3,1),imshow(f0(:,:,:,m));title(['Video Frame :' num2str(m)]);
    subplot(1,3,2),imshow(f(:,:,:,m)); title(['fourier transform :' num2str(m)]);
    subplot(1,3,3),imshow(reconstruct(:,:,m),[]);title(['Reconstructed Frame :' num2str(m)]);end