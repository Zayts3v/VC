function output = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

imageGreyScale = imgaussfilt(imageGreyScale,smoothArg,'FilterSize',kernelSize);

output = imageGreyScale;
end