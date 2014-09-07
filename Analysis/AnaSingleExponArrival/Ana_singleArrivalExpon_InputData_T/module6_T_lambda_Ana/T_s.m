function expectValueTmecr = T_s(s , m , lambda , T)
    
    expectValueTmecr = 0 ;  
    expectValueTmecr = ComputeCycleTime(m , lambda , T) - ComputeCycleTime(s , lambda , T);

end