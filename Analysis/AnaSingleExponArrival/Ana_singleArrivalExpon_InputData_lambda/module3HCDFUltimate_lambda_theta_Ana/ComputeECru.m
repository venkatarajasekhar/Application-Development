function expectValue = ComputeECru( m ,lambda , T)
     expectValue = 0 ;
    for i=0:m-1
       expectValue = expectValue + i*limitPi_j( i, m ,lambda ,T) ; 
    end

    
end