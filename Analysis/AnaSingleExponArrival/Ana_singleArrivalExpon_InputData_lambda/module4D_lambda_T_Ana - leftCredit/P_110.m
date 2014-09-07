function prob = P_110(i, m,lambda ,T)

prob=0 ;
for k = 0:i
  
prob = prob +(1/(m-k)) /SumNormalize(0,m-1,lambda,tmStar(m,lambda,T)) * exp( -lambda*  (tmStar(m,lambda,T)+E_tau0(lambda,T)) ) * (  lambda* (tmStar(m,lambda,T)+E_tau0(lambda,T))  )^(m-k-1) /factx(m-k-1) ;
 
end

end

%prob = prob + (1/(k))*exp( -lambda * tmStar(m,lambda,T) ) * (lambda*tmStar(m,lambda,T))^(k+1) /factx(k+1) ;
%prob =  exp( -lambda * tmStar(m,lambda,T) ) * (lambda*tmStar(m,lambda,T))^i /factx(i) ;
%/SumNormalize(0,m-1,lambda,tmStar(m,lambda,T))


% 
% for k = 1:i
%   
% prob = prob +(1/(m-k)) *exp( -lambda * tmStar(m,lambda,T)/(m-k) ) * ((lambda*tmStar(m,lambda,T)/(m-k))^(m-1-k)) /factx(m-1-k) ;
%  
% end
% prob = prob + (1/(m-k)) *exp( -lambda * tmStar(m,lambda,T)/(m-1) ) * ((lambda*tmStar(m,lambda,T)/(m-1))^(m-1)) /factx(m-1) ;
% end