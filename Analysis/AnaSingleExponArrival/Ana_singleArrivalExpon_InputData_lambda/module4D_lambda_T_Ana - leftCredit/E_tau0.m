function expectValue= E_tau0(lambda,T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
expectValue = 0 ;
expectValue=1/lambda - (T*lambda + 1)/(lambda*exp(T*lambda))  ;

end

%expectValue=1/lambda - (T*lambda + 1)/(lambda*exp(T*lambda)) ;
%1/lambda - (T*lambda + 1)/(lambda*exp(T*lambda))