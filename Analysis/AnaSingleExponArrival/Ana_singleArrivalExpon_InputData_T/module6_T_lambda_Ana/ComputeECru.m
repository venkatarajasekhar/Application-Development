function expectValue = ComputeECru( m ,lambda , T)
     expectValue = 0 ;
    for i=1:m
       expectValue = expectValue + (m-i)*limitPi_j( i, m ,lambda ,T) ; 
    end

    
end