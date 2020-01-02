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

    edgeImage = edge(eqImage, 'canny');

    if (imagetype == 1)
        [centers,radii] = imfindcircles(edgeImage,[60 100],'Sensitivity', 0.96);
        
    elseif (imagetype == 2)
        [centers,radii] = imfindcircles(edgeImage,[180 280],'Sensitivity', 0.97);
        
    else
        [centers,radii] = imfindcircles(edgeImage,[230 300],'Sensitivity', 0.98);
    end
        
    subplot(2,2,1),imshow(imagem); title('Original image');
    viscircles(centers, radii,'EdgeColor','g');
    subplot(2,2,2),imshow(edgeImage); title('Image edges');
    subplot(2,2,3),imhist(eqImage); title('Image histogram');
    subplot(2,2,4),hist(radii); title('Circles sizes histogram');

    result = 1;
end