function sum = sigmax( n , lambdax , T)
        sum=0 ;
        for k=0:n
             
            sum = sum + (exp(-lambdax*T)*(lambdax*T)^k)/factx(k) ;
           
        end 


end
