function L1sum = L1(m , lambda , T)
     L1sum = 1 ;
     if m == 1
         L1sum = 1 ;
     elseif m == 2
         L1sum = 1 + (1-exp(-lambda* T )) ;
     else
          L1sum = 1 + (1-exp(-lambda* T )) +  sigamaPi(m , lambda , T)  ;
     end
end