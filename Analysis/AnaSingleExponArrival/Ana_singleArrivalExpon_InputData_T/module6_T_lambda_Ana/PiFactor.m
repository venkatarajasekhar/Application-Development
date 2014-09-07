function result = PiFactor( j,m , lambda , T)
result = 1 ;

    for s=1:j
        result = result * ( 1 - exp( -lambda * T_s(s, m , lambda , T) ) )  ;
    end
end