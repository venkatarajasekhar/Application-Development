clc
clear all

m =[1 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100];    %Give Credits
lambda=[1 5 10]; 
T = 100 ; %Timer
lambda_unit = 0.1 ;
arraySize = 21 ;
ECruarray = zeros(3,arraySize) ;

for i=1:3
  for ii=1:arraySize
      ECruarray(i,ii) = ComputeECru(m(ii) , lambda(i)*lambda_unit , T ) ;
      fprintf('(i,ii) = (%d,%d)\n',i,ii)
  end
  
end


subplot(2,2,1) ;
En = semilogx( m(1,:), ECruarray(1,:),'r-' ...
        ,m(1,:) , ECruarray(2,:),'g-' ...
        ,m(1,:) , ECruarray(3,:),'b-') ; 
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 1. The effect of \theta and \lambda_m_t_c ( T = 100t, eventCreditUnit = 1 ) '])
ylabel('Average MTC Event Record (E[N])')
title('Expected number of MTC Event Record in one CDR')

set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);
