function prob = P_1(j, m,lambda ,T1,T2)

prob  = 0;
switch j
case 0
   for ii=1:m-1
      prob = prob + 1/(m-ii+1) /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T1))  *exp(-lambda*T2)*( lambda * T2 )^(m-ii)/factx(m-ii) ;
   end
      prob = prob +   1/SumNormalize(0,m-1,lambda,tmStar(m,lambda,T1)) *  exp( -lambda*T2 )  ;

    
% case m-1
%    for ii=1:m-2
%       prob = prob + 1/(m-ii+1) /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T))  *exp(-lambda*T)*( lambda * T )^(m-ii)/factx(m-ii) ;
%    end
%       prob = prob + 1/2 /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T))  *exp(-lambda*T)*(lambda*T)^(1)/factx(1)  ;

otherwise
    for ii=1:j
      prob = prob + 1/(m-ii+1)  /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T1))    *exp(-lambda*T2 ) *  ( lambda * T2 )^(m-ii)/factx(m-ii)  ;
   end
        
end




end