function [output1,output2,output3,output4] = main_CannyDetector(imageGreyScale)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    kernelSize = input('What is the size of your kernel?\n:');
    smoothArg = input('What is the sigma you want?\n:');
    
    imageSmoothed = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg);
    
    [Gx,Gy,Gmag,Gdir] = gradient(imageSmoothed);
    
    imageNonMax = nonmax(imageSmoothed,Gx,Gy,Gmag,Gdir);
    
    T1 = input('What is the first value for threshold?\n:');
    T2 = input('What is the secound value for threshold?\n:');
    
    imageDoubleThreshold = double_threshold(imageNonMax,T1,T2);
    
    result = hysteresis_threshold(imageNonMax,T1,T2);

output1 = Gmag;
output2 = imageNonMax;
output3 = imageDoubleThreshold;
output4 = result;
end

