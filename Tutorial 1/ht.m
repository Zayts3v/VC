function [O,v] = ht(I,v,h,l,i,j)

    v(i,j) = 1;
    
    %inf esquerdo
    if v(i+1,j-1) ~=1
        if I(i+1,j-1) >= h
            v(i+1,j-1) =1;
        elseif I(i+1,j-1) <= l
                I(i+1,j-1) = 0;
                v(i+1,j-1) = 1;
        else
            [I,v] = ht(I,v,h,l,i,j);
        end
    end
    
    if I(i-1,j-1) == 0 && ...
            I(i,j) = 0;
    end
    
    O = I;

end
