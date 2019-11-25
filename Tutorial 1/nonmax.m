function result = nonmax(imageGreyScale,Gx,Gy,Gmag)
% Perform non-maximum suppression using interpolation
    [h,w] = size(imageGreyScale);
    output = zeros(h,w);
    for i=2:h-1 % row
        for j=2:w-1 % col
            if (angle(atan2(i,j))>=0 && angle(atan2(i,j))<=45) || ...
                    (angle(atan2(i,j))<-135 && angle(atan2(i,j))>=-180)
                yBot = [Gmag(i,j+1) Gmag(i+1,j+1)];
                yTop = [Gmag(i,j-1) Gmag(i-1,j-1)];
                x_est = abs(Gy(i,j)/Gmag(i,j)); % y
                if (Gmag(i,j) >= ((yBot(2)-yBot(1))*x_est+yBot(1)) && ...
                    Gmag(i,j) >= ((yTop(2)-yTop(1))*x_est+yTop(1))) % interpolation
                    output(i,j)= Gmag(i,j);
                else
                    output(i,j)=0;
                end
            elseif (angle(atan2(i,j))>45 && angle(atan2(i,j))<=90) || ...
                    (angle(atan2(i,j))<-90 && angle(atan2(i,j))>=-135)
                yBot = [Gmag(i+1,j) Gmag(i+1,j+1)];
                yTop = [Gmag(i-1,j) Gmag(i-1,j-1)];
                x_est = abs(Gx(i,j)/Gmag(i,j));
                if (Gmag(i,j) >= ((yBot(2)-yBot(1))*x_est+yBot(1)) && ...
                    Gmag(i,j) >= ((yTop(2)-yTop(1))*x_est+yTop(1)))
                    output(i,j)= Gmag(i,j);
                else
                    output(i,j)=0;
                end
            elseif (angle(atan2(i,j))>90 && angle(atan2(i,j))<=135) || ...
                    (angle(atan2(i,j))<-45 && angle(atan2(i,j))>=-90)
                yBot = [Gmag(i+1,j) Gmag(i+1,j-1)];
                yTop = [Gmag(i-1,j) Gmag(i-1,j+1)];
                x_est = abs(Gx(i,j)/Gmag(i,j));
                if (Gmag(i,j) >= ((yBot(2)-yBot(1))*x_est+yBot(1)) && ...
                    Gmag(i,j) >= ((yTop(2)-yTop(1))*x_est+yTop(1)))
                    output(i,j)= Gmag(i,j);
                else
                    output(i,j)=0;
                end
            elseif (angle(atan2(i,j))>135 && angle(atan2(i,j))<=180) || ...
                    (angle(atan2(i,j))<0 && angle(atan2(i,j))>=-45)
                yBot = [Gmag(i,j-1) Gmag(i+1,j-1)];
                yTop = [Gmag(i,j+1) Gmag(i-1,j+1)];
                x_est = abs(Gx(i,j)/Gmag(i,j));
                if (Gmag(i,j) >= ((yBot(2)-yBot(1))*x_est+yBot(1)) && ...
                    Gmag(i,j) >= ((yTop(2)-yTop(1))*x_est+yTop(1)))
                    output(i,j)= Gmag(i,j);
                else
                    output(i,j)=0;
                end
            end           
        end
    end
    
    Gmag = NormalizeMatrix(output);
    figure(1); imshow(Gmag);
    
    result = Gmag;
end