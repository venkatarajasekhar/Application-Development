function result=PoissonPdf(i, lambda, T)
result = 0 ;
result = exp(-lambda*T) * (  (lambda*T)^i /factx(i) ) ;

end