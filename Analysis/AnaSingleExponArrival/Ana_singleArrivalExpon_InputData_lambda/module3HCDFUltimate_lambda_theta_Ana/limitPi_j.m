function limitProb = limitPi_j( j, m ,lambda ,T)
 limitProb = 0 ;
     if j == 0
         limitProb = 1/L1(m ,lambda ,T) ;
     else
          limitProb =  ( 1/L1(m ,lambda ,T) )  * PiFactor(j+1,m , lambda , T) ;
     end

end