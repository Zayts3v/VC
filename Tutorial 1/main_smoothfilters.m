function output = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if (typeOfNoise == "salt & pepper")
    x = rand(size(imageGreyScale));
    b = find(x < noiseArg/2);
    imageGreyScale(b) = 0; 
    p = find(x >= noiseArg/2 & x < noiseArg);
    imageGreyScale(p) = 255;
else
    p2 = 0;
    imageGreyScale = im2double(imageGreyScale);
    imageGreyScale = imageGreyScale + sqrt(noiseArg)*randn(size(imageGreyScale)) + p2;
end
 
output = imageGreyScale;
end

