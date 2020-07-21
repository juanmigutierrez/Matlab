       %Volver a enviar a los cuadrantes
       if  coordx<0 && coordy>0
           rown = coord_x + centro;
           coln = centro - coordy;
       % 2do cuuadrante
       elseif coordx>0 && coordy>0
           rown = centro - coordy;
           coln = centro + coordx;
       % 3er cuadrante
       elseif coordx<0 && coordy<0
           rown = centro - coord_y;
           coln = centro - coordx;
       % 4to cuadrante
       elseif coord_x>=0 && coordy<=0
           rown = coord_x + centro;
           coln = centro - coordy;
       end