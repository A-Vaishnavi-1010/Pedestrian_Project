% optical flow describes a sparse or dense vector field, where a displacement vector is assigned
% to certain pixel position, that points to where that pixel can be found in another image.

clc;
close all;
clear all;
vidReader = VideoReader('media\People.mp4','CurrentTime',0.5);
% Estimate optical flow using Horn-Schunck method
% returns an optical flow object that is used to estimate the direction and speed of an 
% object’s motion

opticFlow = opticalFlowHS;  
% figure creates a new figure window using default property values. 
% The resulting figure is the current figure.
% The current figure is the target for graphics commands such as axes and colormap.
h = figure;
% movegui(h) moves the figure to the onscreen position.
movegui(h);   
% Create panel container object
hViewPanel = uipanel(h,'Position',[0 0 1 1],'Title','Plot of Optical Flow Vectors');
% axes creates the default Cartesian axes in the current figure and makes it the current axes
hPlot = axes(hViewPanel);

while hasFrame(vidReader)             % Determine if frame is available to read (hasFrame)
    frameRGB = readFrame(vidReader);
    frameGray = rgb2gray(frameRGB);  
%     estimates the optical flow of the input image, I, with respect to the previous image. 
%     The function sets the previous image for the first run to a black image. After the first 
%     run, each new image, I, becomes the current image, and the image from the last run becomes 
%     the previous one. 
    flow = estimateFlow(opticFlow,frameGray);
    imshow(frameRGB)
    hold on
    plot(flow,'DecimationFactor',[5 5],'ScaleFactor',60,'Parent',hPlot);
    hold off

    pause(10^-3)       % Stop MATLAB execution temporarily
end