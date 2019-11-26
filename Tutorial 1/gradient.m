function [output1,output2,output3,output4] = gradient(imageGreyScale)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[Gx,Gy] = imgradientxy(imageGreyScale);

[Gmag,Gdir] = imgradient(Gx,Gy);

Gdir2 = atan2(Gy,Gx);

output1 = Gx;
output2 = Gy;
output3 = Gmag;
output4= Gdir2;
end