function output = main_smoothfilters(imageGreyScale,typeOfNoise,noiseArg,filteringDomain,typeOfSmooth,a,z)

    %A = fft2(imageGreyScale);

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
    %B = fft2(imageGreyScale);

    if (filteringDomain == "spatial")

        matrix = ones(a);
        if (typeOfSmooth == "average")

            for i = 1:a
                for j = 1:a
                    matrix(i,j) = 1/(a*a);
                end
            end
            imageGreyScale = conv2(imageGreyScale,matrix);
        elseif (typeOfSmooth == "gaussian")
            h = fspecial('gaussian',z,a);
            imageGreyScale = imfilter(imageGreyScale, h);
        else
            [p,q] = size(matrix);
            imageGreyScale = medfilt2(imageGreyScale,[p q]);
        end  
    else
        f = double(imageGreyScale);
        [M N] = size(f);
        P = 2*M;
        Q = 2*N;
        f = padarray(f,[M N],'post');
            
        for i = 1:M
            for j = 1:N
                f(i,j) = (-1)^(i+j) * f(i,j);
            end 
        end
            
        G = fft2(f);
            
        if strcmp(typeOfSmooth, 'gaussian')
            H = fspecial('gaussian',[P Q],a);
        elseif strcmp(typeOfSmooth, 'butter')
            H = double(zeros(P,Q));
            filter_order = a;
            cutoff = z;
            for i=1:P
                for j=1:Q
                    dist = ((i-P/2)^2 + (j-Q/2)^2)^0.5;
                    H(i,j) = 1 / (1 + (cutoff/dist)^(2*filter_order));
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
        
        imageGreyScale = uint8(smoothed_image(1:M, 1:N));
    end
      
    figure(2),imshow(imageGreyScale);

    %C = fft2(imageGreyScale);

    %figure(1),imshow(A);
    %figure(2),imshow(B);
    %figure(3),imshow(C);

    output = imageGreyScale;
end

