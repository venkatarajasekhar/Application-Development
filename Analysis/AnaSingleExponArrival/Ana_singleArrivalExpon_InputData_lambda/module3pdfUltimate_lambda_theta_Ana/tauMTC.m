function result=tauMTC(m,lambda,T)
result = 0 ;
result =(m-1)/ lambda *( 1 - sumPoisson(0,m-1,lambda,T )  ) /(m-1);


end