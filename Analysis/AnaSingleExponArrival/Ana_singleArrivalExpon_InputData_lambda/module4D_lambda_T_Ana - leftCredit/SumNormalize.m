function result=SumNormalize(s,m,lambda,T)
result= 0 ;
for i =s:m
    result= result + exp(-lambda*T)*(lambda*T)^(i)/(factx(i)) ;
    
end    

end
