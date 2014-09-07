function sum=factx(n)

sum = 1 ;
if(n==0)
 sum = 1 ;   
 else  
for i=1:n
sum = sum * i ;
 end
 end

end

% function sum=factx(n)
% 
% if n>1
%     sum=n*factx(n-1);
% else
%     sum=1;
% end