function prob = P_1(j, m,lambda ,T)

prob  = 0;
switch j
case 0
  
    prob = E_tau0(lambda,T)/(E_tau0(lambda,T) + tmStar(m ,lambda, T)) ;

    
% case m-1
%    for ii=1:m-2
%       prob = prob + 1/(m-ii+1) /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T))  *exp(-lambda*T)*( lambda * T )^(m-ii)/factx(m-ii) ;
%    end
%       prob = prob + 1/2 /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T))  *exp(-lambda*T)*(lambda*T)^(1)/factx(1)  ;

otherwise
  
       prob = tauMTC(m,lambda,T)/(E_tau0(lambda,T) + tmStar(m ,lambda, T))  ; 
end




end