function result = PiFactor( j,m , lambda , T)
result = 1 ;

    for s=j:m
        result = result * ( 1 - exp( -lambda * T_s(m-s, m , lambda , T) ) )  ;
    end
end