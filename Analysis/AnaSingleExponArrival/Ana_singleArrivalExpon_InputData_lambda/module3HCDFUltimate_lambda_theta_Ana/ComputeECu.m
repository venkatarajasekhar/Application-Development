function expectValue=ComputeECu(m , lambda , T)
m1 = m-1 ;
m2 = m-2 ;
expectValue = m-lambda*( ((m-1)/lambda)*(1- sigmax(m1 , lambda , T ) ) + T * sigmax(m2 , lambda , T)) ;

end