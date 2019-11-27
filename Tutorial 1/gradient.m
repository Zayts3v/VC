function [output1,output2,output3,output4] = gradient(imageGreyScale)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    [Gx,Gy] = imgradientxy(imageGreyScale);

    for i = 1:size(Gx)
        for j = 1:size(Gy)
            Gmag(i,j) = sqrt(double(Gx(i,j)^2 + Gy(i,j)^2));
        end
    end

    Gdir2 = atan2(Gy,Gx);

    output1 = Gx;
    output2 = Gy;
    output3 = Gmag;
    output4= Gdir2;
end