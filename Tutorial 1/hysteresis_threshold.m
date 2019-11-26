function result = hysteresis_threshold(imageGreyScale,lo,hi)

    I = imageGreyScale;

    output = ones(size(I,1),size(I,2));
    b = zeros(size(I,1),size(I,2));
    Tl = zeros(size(I,1),size(I,2));
    
    count = 1;
    
    for row = 1:size(I,1)
        for col = 1:size(I,2)
            if(I(row,col) >= hi)
                seeds(count,:) = [row col];
                count = count + 1;
                output(row,col) = 255;
            else
                if(I(row,col) >= lo)
                    Tl(row,col) = 1;
                end
            end
        end
    end
    
    for i = 1:size(seeds,1)
        [output b] = testNeighborhood(Tl,b,seeds(i,1),seeds(i,2), output);
    end
    %figure(4),imshow([output b]);
    result = [output b];
end