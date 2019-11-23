function [output1,output2] = gradient(imageGreyScale)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[Gx,Gy] = imgradientxy(imageGreyScale);

[Gmag,Gdir] = imgradient(Gx,Gy);

output1 = Gmag;
output2 = Gdir;
end