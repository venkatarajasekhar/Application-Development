function summ = sigmax( m , lambda , T)
        summ=0 ;
        for k=0:m
             
            summ = summ + exp(-lambda*T)*(lambda*T)^k/factx(k) ;
           
        end 


end
