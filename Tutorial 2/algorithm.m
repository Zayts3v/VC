function result = algorithm(imageGreyScale,typeOfNoise,noiseArg)

    if (typeOfNoise == "salt & pepper")
        noiseImage = imnoise(imageGreyScale,'salt & pepper',noiseArg);
    else
        noiseImage = imnoise(imageGreyScale,'gaussian',noiseArg);
    end
     
    edgeImage = edge(noiseImage, 'canny');
    
    radii = 60:1:100;
    
    h = circle_hough(edgeImage, radii,'same','normalise');
    
    peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 5);
    
    figure(1), imshowpair(imageGreyScale,edgeImage,'montage');
    hold on;
    for peak = peaks
        [x, y] = circlepoints(peak(3));
        plot(x+peak(1), y+peak(2), 'g-');
    end
    hold off
    
    result = edgeImage;
end