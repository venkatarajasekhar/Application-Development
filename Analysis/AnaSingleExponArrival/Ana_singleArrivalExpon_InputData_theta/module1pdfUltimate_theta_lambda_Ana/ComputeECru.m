  function expectValue = ComputeECru( m ,lambda , T)
     expectValue = 0 ;
       for j=1:m-1
       expectValue = expectValue + j * P_mecr(j,m,lambda,T) ;
      end
    
  end
