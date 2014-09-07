function L1sum = L1(m , lambda , T)
     L1sum = 1 ;
     if m == 1
         L1sum = 1 ;
     else
          L1sum = 1  +  sigamaPi(m-1 , lambda , T)  ;
     end
end