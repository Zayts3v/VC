function result = double_threshold(imageGreyScale,T1,T2)

    imageGreyScale = imageGreyScale .* (imageGreyScale >= T1 & imageGreyScale <= T2);
    
    result = imageGreyScale;
end
