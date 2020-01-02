function result = main_image_recognition(imagetype,imageGreyScale,typeOfNoise,noiseArg)

    if (typeOfNoise == "salt & pepper")
        noiseImage = imnoise(imageGreyScale,'salt & pepper',noiseArg);
        filter = fspecial('average',11);
        filteredImage = imfilter(noiseImage,filter);
    else
        noiseImage = imnoise(imageGreyScale,'gaussian',noiseArg);
        filteredImage = imgaussfilt(noiseImage,7,'FilterSize',11,'FilterDomain','spatial');
    end

    edgeImage = edge(filteredImage, 'canny');

    if (imagetype == 1)
        [centers,radii] = imfindcircles(edgeImage,[60 100],'Sensitivity', 0.97);
        
    elseif (imagetype == 2)
        [centers,radii] = imfindcircles(edgeImage,[180 280],'Sensitivity', 0.97);
        
    else
        [centers,radii] = imfindcircles(edgeImage,[220 300],'Sensitivity', 0.985);
    end
        
    figure(1),imshowpair(imageGreyScale,edgeImage,'montage');
    viscircles(centers, radii,'EdgeColor','g');

    result = edgeImage;
end