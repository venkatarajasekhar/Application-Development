function expectValue= E_tau01(m,lambda,T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
expectValue = 0 ;
expectValue=1/lambda ;

%expectValue=1/lambda - (lambda*( 1/lambda+tmStar(m,lambda,T) ) + 1)/(lambda*exp(lambda*( 1/lambda+tmStar(m,lambda,T)  ) )) ;
end
%1/lambda - (lambda*a + 1)/(lambda*exp(lambda*a))