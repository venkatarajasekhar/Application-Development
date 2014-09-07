function sum = sumPoisson( s,m, lambda, T )
sum = 0 ;
for k=s:m 
sum = sum + PoissonPdf( k, lambda, T) ;
end
end