clc
clear all
load Data_singleArrivalExpon_theta_1lambdaMTC.txt ;
load Data_singleArrivalExpon_theta_5lambdaMTC.txt ;
load Data_singleArrivalExpon_theta_10lambdaMTC.txt ;
%figure(1)

format long e

m =[1 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100];    %Give Credits
lambda=[1 5 10]; 
T = 100 ; %Timer
lambda_unit = 0.1 ;
marraySize = 21 ;
ENarray = zeros(3,marraySize) ;
ECuarray = zeros(3,marraySize) ;
ECruarray = zeros(3,marraySize) ;

for i=1:3
  for ii=1:marraySize
      ENarray(i,ii) = ComputeEN(m(ii) , lambda(i)*lambda_unit , T ) ;
   end
end


subplot(2,2,1) ;
En = semilogx(Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , Data_singleArrivalExpon_theta_1lambdaMTC(:,2),'rO' ...
        ,Data_singleArrivalExpon_theta_5lambdaMTC(:,1) , Data_singleArrivalExpon_theta_5lambdaMTC(:,2),'g*' ...
        ,Data_singleArrivalExpon_theta_10lambdaMTC(:,1) , Data_singleArrivalExpon_theta_10lambdaMTC(:,2),'bdiamond' ...
        ,m(1,:), ENarray(1,:),'r-' ...
        ,m(1,:) , ENarray(2,:),'g-' ...
        ,m(1,:) , ENarray(3,:),'b-') ; 
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 1. The effect of \theta and \lambda_m_t_c ( T = 100t, eventCreditUnit = 1 ) '])
ylabel('Average MTC Event Record (E[N])')
title('Expected number of MTC Event Record in one CDR')
legend('\lambda_m_t_c=\lambda_a (sim)','\lambda_m_t_c=5\lambda_a (sim)','\lambda_m_t_c=10\lambda_a (sim)', ...
       '\lambda_m_t_c=\lambda_a (ana)','\lambda_m_t_c=5\lambda_a (ana)','\lambda_m_t_c=10\lambda_a (ana)')
set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);


%figure(2)

for i=1:3
  for ii=1:marraySize
      ECuarray(i,ii) = ComputeECu( m(ii) , lambda(i)*lambda_unit , T ) ;
   end
end



subplot(2,2,2) ;
Ecu=semilogx(Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , Data_singleArrivalExpon_theta_1lambdaMTC(:,3),'rO' ...
        ,Data_singleArrivalExpon_theta_5lambdaMTC(:,1) , Data_singleArrivalExpon_theta_5lambdaMTC(:,3),'g*' ...
        ,Data_singleArrivalExpon_theta_10lambdaMTC(:,1) , Data_singleArrivalExpon_theta_10lambdaMTC(:,3),'bdiamond' ...
        ,m(1,:) , ECuarray(1,:),'r-' ...
        ,m(1,:) , ECuarray(2,:),'g-'...
        ,m(1,:) , ECuarray(3,:),'b-') ;
    
ylabel('E[C_u] Unit: credit')
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 2. The effect of \theta and \lambda_m_t_c ( T = 100t, eventCreditUnit = 1 ) '])
title('Expected number of unused reserved credit at the end of MECR operation ')
legend('\lambda_m_t_c=\lambda_a (sim)','\lambda_m_t_c=5\lambda_a (sim)','\lambda_m_t_c=10\lambda_a (sim)', ...
       '\lambda_m_t_c=\lambda_a (ana)','\lambda_m_t_c=5\lambda_a (ana)','\lambda_m_t_c=10\lambda_a (ana)')
set(Ecu, 'linewidth', 2);
set(Ecu, 'MarkerSize', 8);



%figure(3)

for i=1:3
  for ii=1:marraySize
      ECruarray(i,ii) = ComputeECru( m(ii) , lambda(i)*lambda_unit , T ) ;
      fprintf('module1 (i,ii) = (%d,%d)\n',i,ii) 
  end
end


subplot(2,2,3) ;
Erc=semilogx(Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , Data_singleArrivalExpon_theta_1lambdaMTC(:,4),'rO' ...
        ,Data_singleArrivalExpon_theta_5lambdaMTC(:,1) , Data_singleArrivalExpon_theta_5lambdaMTC(:,4),'g*' ...
        ,Data_singleArrivalExpon_theta_10lambdaMTC(:,1) , Data_singleArrivalExpon_theta_10lambdaMTC(:,4),'bdiamond' ...
         ,m(1,:) , ECruarray(1,:),'r-' ...
        ,m(1,:) , ECruarray(2,:),'g-'...
        ,m(1,:) , ECruarray(3,:),'b-') ;
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 3. The effect of \theta and \lambda_m_t_c ( T = 100t, eventCreditUnit = 1, \lambda_u_s_e_r = \lambda_u )'])
           %\lambda_u = \lambda_user_unit
ylabel('E[C_r_u] Unit: credits')
title('Expected number of Random User Check Unused Reserved Credits')

legend('\lambda_m_t_c=\lambda_a (sim)','\lambda_m_t_c=5\lambda_a (sim)','\lambda_m_t_c=10\lambda_a (sim)', ...
       '\lambda_m_t_c=\lambda_a (ana)','\lambda_m_t_c=5\lambda_a (ana)','\lambda_m_t_c=10\lambda_a (ana)')
set(Erc, 'linewidth', 2);
set(Erc, 'MarkerSize', 8);



hold on