function sum = sigamaPi(m , lambda , T) 
  
        sum = 0 ;  
        m1= m-1 ;
        for j=2:m1
            sum = sum + (1- exp(-lambda * T )) * PiFactor(j-1 ,m , lambda , T) ;
        end


end