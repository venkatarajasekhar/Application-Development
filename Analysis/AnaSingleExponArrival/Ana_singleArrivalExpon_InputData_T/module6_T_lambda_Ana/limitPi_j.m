function limitProb = limitPi_j( jcolumn, m ,lambda ,T)
 limitProb = 0 ;
     if jcolumn == 0
         limitProb = 1/L1(m ,lambda ,T) ;
     elseif jcolumn == 1
         limitProb =  ( 1/L1(m ,lambda ,T) ) * ( 1- exp(-lambda* T ) ) ;
     else
          limitProb =  ( 1/L1(m ,lambda ,T) )  * ( 1- exp(-lambda* T )) * PiFactor(jcolumn-1,m , lambda , T) ;
     end

end