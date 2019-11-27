function [O,v] = ht(I,v,high,low,i,j)

    v(i,j) = 1;
    
    % Direita
    if v(i,j+1) ~=1
        if I(i,j+1) >= high
            v(i,j+1) =1;
        elseif I(i,j+1) <= low
                I(i,j+1) = 0;
                v(i,j+1) = 1;
        else
            [I,v] = ht(I,v,high,low,i,j);
        end
    end
    
    % Inferior esquerdo
    if v(i+1,j-1) ~=1
        if I(i+1,j-1) >= high
            v(i+1,j-1) =1;
        elseif I(i+1,j-1) <= low
                I(i+1,j-1) = 0;
                v(i+1,j-1) = 1;
        else
            [I,v] = ht(I,v,high,low,i,j);
        end
    end
    
    % Inferior
    if v(i+1,j) ~=1
        if I(i+1,j) >= high
            v(i+1,j) =1;
        elseif I(i+1,j) <= low
                I(i+1,j) = 0;
                v(i+1,j) = 1;
        else
            [I,v] = ht(I,v,high,low,i,j);
        end
    end
    
    % Inferior direito
    if v(i+1,j+1) ~=1
        if I(i+1,j+1) >= high
            v(i+1,j+1) =1;
        elseif I(i+1,j+1) <= low
                I(i+1,j+1) = 0;
                v(i+1,j+1) = 1;
        else
            [I,v] = ht(I,v,high,low,i,j);
        end
    end
    
    if (I(i-1,j-1) == 0 && I(i-1,j) == 0 && I(i+1,j-1) == 0 && I(i,j-1) == 0 && I(i,j+1) == 0 && I(i+1,j-1) == 0 && I(i+1,j) == 0 && I(i+1,j+1) == 0)
            I(i,j) = 0;
    end
    
    O = I;

end
