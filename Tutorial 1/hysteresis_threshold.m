function result = hysteresis_threshold(imageGreyScale,lo,hi,M,N)

    I = imageGreyScale;
    v = zeros(M,N);

    for i = 1:M
        for j = 1:N
            if v(i,j) ~=1
                if I(i,j) >= hi
                   v(i,j)=1;
                elseif I(i,j) <= lo
                   I(i,j)=0;
                    v(i,j)=1;
                else
                    [I,v]=ht(I,v,h,l,i,j);
                end
            end
        end
    end
    
    result = I;
                    
end