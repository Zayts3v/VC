function [O b] = testNeighborhood( Tl , b, row, col, O )

if(b(row,col) == 1)
    return
end

b(row,col) = 1;

for i = -1:1
    if(row+i >= 1 && row+i <= size(b,1))
      for j = -1:1
        if(col+j >= 1 && col+j <= size(b,2))
          if(Tl(row+i,col+j))
            [O b] = testNeighborhood(Tl, b, row+i, col+j, O);
            O(row,col) = 255;
          end
        end
      end
    end
end

end
