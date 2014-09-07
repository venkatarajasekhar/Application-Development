function expectValue= E_tau02(lambda,T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
expectValue = 0 ;

expectValue=1/lambda - (lambda*( 1/lambda+T ) + 1)/(lambda*exp(lambda*( 1/lambda+T ) )) ;
end
