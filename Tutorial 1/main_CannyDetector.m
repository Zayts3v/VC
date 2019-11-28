function [output1,output2,output3] = main_CannyDetector(imageGreyScale)

    kernelSize = input('What is the size of your kernel?\n:');
    smoothArg = input('What is the sigma you want?\n:');
    
    imageSmoothed = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg);
    [M,N] = size(imageSmoothed);
    
    [Gx,Gy,Gmag,Gdir] = gradient(imageSmoothed);
    
    imageNonMax = nonmax(imageSmoothed,Gx,Gy,Gmag,Gdir);
    
    T1 = input('What is the first value for threshold?\n:');
    T2 = input('What is the secound value for threshold?\n:');
    
    result = hysteresis_threshold(imageNonMax,T1,T2,M,N);

output1 = Gmag;
output2 = imageNonMax;
output3 = result;
end

