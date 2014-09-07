function expectValueTmecr = T_s(s , m , lambda , T)
    
    expectValueTmecr = 0 ; 
    if s==0
        expectValueTmecr = T ;
    else
    expectValueTmecr = ComputeCycleTime(m , lambda , T) - ComputeCycleTime(s , lambda , T);
   end
end