function [output1,output2,output3] = main_CannyDetector(imageGreyScale)

    kernelSize = input('What is the size of your kernel?\n  Type "-1" for default values\n:');
    if(kernelSize==(-1))
        kernelSize = 5;
    end
    smoothArg = input('What is the sigma you want?\n  Type "-1" for default values\n:');
    if(smoothArg==(-1))
        smoothArg = 2;
    end
    
    imageSmoothed = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg);
    [M, N] = size(imageSmoothed);
    
    [Gx,Gy,Gmag,Gdir] = gradient(imageSmoothed);
    
    imageNonMax = nonmax(imageSmoothed,Gx,Gy,Gmag,Gdir);
    
    T1 = input('What is the first value for threshold?\n  Type "-1" for default values\n:');
    if(T1==(-1))
        T1 = 0.4;
    end
    T2 = input('What is the secound value for threshold?\n  Type "-1" for default values\n:');
    if(T2==(-1))
        T2 = 0.8;
    end

    result = hysteresis_threshold(imageNonMax,T1,T2,M,N);

output1 = Gmag;
output2 = imageNonMax;
output3 = result;
end
