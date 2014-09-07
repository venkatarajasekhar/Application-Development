function prob = P_2(j, m,lambda ,T)

prob  = 0;
switch j
case 0
prob = E_tau0( lambda,T)/( E_tau0( lambda,T)+ T );



otherwise
    for ii=1:j
      prob = prob + T/(m-ii)/( E_tau0( lambda,T)+ T )  /SumNormalize( 0, m-2, lambda,T )     *exp(-lambda*T)*( lambda * T )^(m-ii-1)/factx(m-ii-1)  ;
   end
        
end




end