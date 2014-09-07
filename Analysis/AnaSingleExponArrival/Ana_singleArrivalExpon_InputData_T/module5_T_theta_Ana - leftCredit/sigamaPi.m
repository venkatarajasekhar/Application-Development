function sum = sigamaPi(m , lambda , T) 
  
        sum = 0 ;  
         
        for j=1:m
            sum = sum +  PiFactor(j+1,m+1 , lambda , T) ;
        end


end