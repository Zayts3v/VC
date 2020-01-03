function result = main_image_recognition(original,imagetype,imageGreyScale,typeOfNoise,noiseArg)

    if (typeOfNoise == "salt & pepper")
        noiseImage = imnoise(imageGreyScale,'salt & pepper',noiseArg);
        filter = fspecial('average',11);
        filteredImage = imfilter(noiseImage,filter);
    else
        noiseImage = imnoise(imageGreyScale,'gaussian',noiseArg);
        filteredImage = imgaussfilt(noiseImage,7,'FilterSize',11,'FilterDomain','spatial');
    end

    snr = signal_to_noise_ratio(original, noiseImage);
    fprintf("%d", snr);

    eqImage = histeq(filteredImage);

    if (imagetype == 1)
        edgeImage = edge(filteredImage, 'canny');
        eqImage = filteredImage;
        
        [centers,radii] = imfindcircles(edgeImage,[60 100],'Sensitivity', 0.96);
        
    elseif (imagetype == 2)
        edgeImage = edge(eqImage, 'canny');
        
        [centers,radii] = imfindcircles(edgeImage,[180 280],'Sensitivity', 0.97);
        
    else
        edgeImage = edge(eqImage, 'canny');
        
        [centers,radii] = imfindcircles(edgeImage,[230 300],'Sensitivity', 0.98);
    end
        
    subplot(2,2,1),imshow(original); title('Original image');
    viscircles(centers, radii,'EdgeColor','g');
    subplot(2,2,2),imshow(noiseImage); title('Image with noise');
    viscircles(centers, radii,'EdgeColor','g');
    subplot(2,2,3),imshow(eqImage); title('Pre-processed image;');
    subplot(2,2,4),hist(radii); title('Distribution of object sizes');

    result = 1;
end