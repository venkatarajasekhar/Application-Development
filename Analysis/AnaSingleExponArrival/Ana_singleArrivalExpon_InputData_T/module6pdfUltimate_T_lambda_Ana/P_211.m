function prob = P_211(j, m,lambda ,T)

prob  = 0;
switch j
case 0
prob = E_tau0( lambda,T)/( E_tau0( lambda,T)+ T );

    
% case m-1
%    for ii=1:m-2
%       prob = prob + 1/(m-ii+1)   *exp(-lambda*T)*( lambda * T )^(m-ii)/factx(m-ii) ;
%    end
%       prob = prob + 1/2   *exp(-lambda*T)*(lambda*T)^(1)/factx(1)  ;

otherwise
    for ii=1:j
      prob = prob + T/(m-ii)/( E_tau0( lambda,T)+ T ) /SumNormalize( 0, m-2, lambda,T )     *exp(-lambda*T)*( lambda * T )^(m-ii-1)/factx(m-ii-1)  ;
   end
        
end




end

% (1-sumPoisson(0,j,lambda,T))
%   prob = prob + (1/(m-k))  /SumNormalize( 0, m-2, lambda,T ) * exp( -lambda * T  ) *  ( lambda * T )^(m-k-1)  /factx(m-k-1)  ;


% function prob = P_2(j, m,lambda ,T)
% 
% prob  = 0;
% switch j
% case 0
%      for ii=1:m-2
%       prob = prob + 1/(m-ii+1)    *(1-sumPoisson(0,m-2-ii,lambda,T))   *exp(-lambda*T)*( lambda * T )^(m-ii)/factx(m-ii)  ;
%      end
%        prob = prob + 1/2  *(1-exp(-lambda*T))  *exp(-lambda*T)*(lambda*T)^(1)/factx(1)   +   1 *exp(-lambda*T) *exp(-lambda*T);
% 
% case m-1
%    for ii=1:m-2
%       prob = prob + 1/(m-ii+1)    *(1-sumPoisson(0,m-2-ii,lambda,T))   *exp(-lambda*T)*( lambda * T )^(m-ii)/factx(m-ii) ;
%    end
%       prob = prob + 1/2  *(1-exp(-lambda*T))  *exp(-lambda*T)*(lambda*T)^(1)/factx(1)  ;
% 
% otherwise
% 
% 
%     
%     for ii=1:j
%       prob = prob + 1/(m-ii+1)    *(1-sumPoisson(0,m-2-ii,lambda,T))   *exp(-lambda*T)*( lambda * T )^(m-ii)/factx(m-ii)  ;
%    end
%         
% end
% 
% 
% 
% 
% end