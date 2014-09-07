function expectValue=ComputeCycleTime(m , lambda , T)

expectValue = ((m-1)/lambda)*(1- sigmax(m-1 , lambda , T ) ) + T * sigmax(m-2 , lambda , T) ;
end