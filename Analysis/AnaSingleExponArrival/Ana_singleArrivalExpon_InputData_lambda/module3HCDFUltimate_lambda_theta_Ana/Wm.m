function result = Wm(m ,lambda, T)
result = 0 ;
result =(m)/ lambda*( 1 - sumPoisson(0,m,lambda,T+E_tau0(lambda,T) )  ) ;

end

%*(m-1)*( 1 - sumPoisson(m-1,lambda,T) )/ lambda 