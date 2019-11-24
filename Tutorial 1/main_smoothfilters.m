function output = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg,filteringDomain,typeOfSmooth, smoothArg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
A = fft2(imageGreyScale);
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
figure(1),imshow(imageGreyScale);
B = fft2(imageGreyScale);

if (filteringDomain == "spatial")
    matrix = ones(smoothArg);
    if (typeOfSmooth == "average")
        for i = 1:smoothArg
            for j = 1:smoothArg
                matrix(i,j) = 1/(smoothArg*smoothArg);
            end
        end
        imageGreyScale = conv2(imageGreyScale,matrix);
    elseif (typeOfSmooth == "gaussian")
        kernelSize = input('What is the size of your kernel?\n:');
        
        h = fspecial('gaussian',kernelSize,smoothArg);
        imageGreyScale = imfilter(imageGreyScale, h);
    else
        [p,q] = size(matrix);
        imageGreyScale = medfilt2(imageGreyScale,[p q]);
    end  
else
    if (typeOfSmooth == "gaussian")
        f = imageGreyScale;
        PQ = paddedsize(size(f));
        h = fspecial('gaussian',size(PQ),smoothArg);
        F = fft2(double(f), PQ(1), PQ(2));
        H = fft2(double(h), PQ(1), PQ(2));
        F_fH = H.*F;
        ffi = ifft2(F_fH);
        imageGreyScale = ffi(2:size(f,1)+1, 2:size(f,2)+1);
        %figure(4),imshow(imageGreyScale);
    else
        %doing
    end
end
figure(2),imshow(imageGreyScale);

C = fft2(imageGreyScale);

%figure(1),imshow(A);
%figure(2),imshow(B);
%figure(3),imshow(C);

output = imageGreyScale;
end

