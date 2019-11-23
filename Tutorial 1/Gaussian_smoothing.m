function output = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

h = fspecial('gaussian',kernelSize,smoothArg);
imageGreyScale = imfilter(imageGreyScale, h);

output = imageGreyScale;
end