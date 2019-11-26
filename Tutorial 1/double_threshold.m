function result = double_threshold(imageGreyScale,T1,T2)

    imageGreyScale = imageGreyScale .* (imageGreyScale >= T1 & imageGreyScale <= T2);
    %figure(2); imshow(imageGreyScale);
    
    result = imageGreyScale;
end
