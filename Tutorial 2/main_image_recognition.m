function result = main_image_recognition(imagetype,imageGreyScale,typeOfNoise,noiseArg)

    if (typeOfNoise == "salt & pepper")
        noiseImage = imnoise(imageGreyScale,'salt & pepper',noiseArg);
    else
        noiseImage = imnoise(imageGreyScale,'gaussian',noiseArg);
    end
     
    edgeImage = edge(noiseImage, 'canny');
    
    if (imageType == 1)
        [centers,radii] = imfindcircles(edgeImage,[60 100],'Sensitivity', 0.97);
        
    elseif (imageType == 2)
        [centers,radii] = imfindcircles(edgeImage,[60 100],'Sensitivity', 0.97);
    else
        [centers,radii] = imfindcircles(edgeImage,[60 100],'Sensitivity', 0.97);
    end
        
    figure(1),imshow(imageGreyScale);
    viscircles(centers, radii,'EdgeColor','g');
    
    figure(2), imshow(edgeImage);
    result = edgeImage;
end