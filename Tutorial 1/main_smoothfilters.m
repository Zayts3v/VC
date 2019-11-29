function [output,output1] = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg,filteringDomain,typeOfSmooth,a,z)
    
    noiseImage = imageGreyScale;
    if (typeOfNoise == "salt & pepper")
        x = rand(size(noiseImage));
        b = find(x < noiseArg/2);
        noiseImage(b) = 0; 
        p = find(x >= noiseArg/2 & x < noiseArg);
        noiseImage(p) = 255;
    else
        p2 = 0;
        noiseImage = im2double(noiseImage);
        noiseImage = noiseImage + sqrt(noiseArg)*randn(size(noiseImage)) + p2;
    end
    
    smoothImage = noiseImage;
    if (filteringDomain == "spatial")
        smoothImage = im2double(smoothImage);
        matrix = ones(a);
        if (typeOfSmooth == "average")

            for i = 1:a
                for j = 1:a
                    matrix(i,j) = 1/(a*a);
                end
            end
            smoothImage = conv2(smoothImage,matrix);
        elseif (typeOfSmooth == "gaussian")
            h = fspecial('gaussian',z,a);
            smoothImage = imfilter(smoothImage, h);
        else
            [p,q] = size(matrix);
            smoothImage = medfilt2(smoothImage,[p q]);
        end  
    else
        f = im2double(smoothImage);
        [M N] = size(f);
        P = 2*M;
        Q = 2*N;
        f = padarray(f,[M N],'post');
            
        for i = 1:P
            for j = 1:Q
                f(i,j) = (-1)^(i+j) * f(i,j);
            end 
        end
            
        G = fft2(f);
            
        if strcmp(typeOfSmooth, 'Gaussian')
            H = fspecial('gaussian',[P Q],a);
            H = mat2gray(H);
        elseif strcmp(typeOfSmooth, 'butter')

            H = double(zeros(P,Q));
            filter_order = a;
            cutoff = z;
 
            for i=1:P
                for j=1:Q
                    dist = ((i-P/2)^2 + (j-Q/2)^2)^0.5;
                    H(i,j) = 1 / (1 + (dist/cutoff)^(2*filter_order));
                end
            end
        end
        
        G = H .* G;

        smoothed_image = (ifft2(G));
        smoothed_image = real(smoothed_image);
        
        for i=1:M
            for j=1:N
                smoothed_image(i,j) = (-1)^(i+j) * smoothed_image(i,j);
            end
        end

        smoothImage = (smoothed_image(1:M, 1:N));
    end
 
    output  = noiseImage;
    output1 = smoothImage;
end

