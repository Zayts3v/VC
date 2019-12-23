function result = algorithm(imageGreyScale,typeOfNoise,noiseArg)

    if (typeOfNoise == "salt & pepper")
        noiseImage = imnoise(imageGreyScale,'salt & pepper',noiseArg);
    else
        noiseImage = imnoise(imageGreyScale,'gaussian',noiseArg);
    end



    
end