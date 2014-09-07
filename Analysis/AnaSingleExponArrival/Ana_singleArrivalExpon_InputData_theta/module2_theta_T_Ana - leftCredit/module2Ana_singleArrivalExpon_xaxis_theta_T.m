clc
clear all
load Data_singleArrivalExpon_theta_25T.txt ;
load Data_singleArrivalExpon_theta_50T.txt ;
load Data_singleArrivalExpon_theta_100T.txt ;



format long e

m =[1 3 5 7 9 10 15 20 30 40 50 55 60 65 70 75 80 85 90 95 100];    %Give Credits
lambda=5; 
T = [25 50 100] ; %Timer
lambda_unit = 0.1 ;
marraySize = 21 ;
ENarray = zeros(3,marraySize) ;
ECuarray = zeros(3,marraySize) ;
ECruarray = zeros(3,marraySize) ;
%figure(1)
for i=1:3
  for ii=1:marraySize
      ENarray(i,ii) = ComputeEN(m(ii) , lambda*lambda_unit , T(i) ) ;
   end
end


subplot(2,2,1) ;
En = semilogx(Data_singleArrivalExpon_theta_25T(:,1) , Data_singleArrivalExpon_theta_25T(:,2),'rO' ...
        ,Data_singleArrivalExpon_theta_50T(:,1) , Data_singleArrivalExpon_theta_50T(:,2),'g*' ...
        ,Data_singleArrivalExpon_theta_100T(:,1) , Data_singleArrivalExpon_theta_100T(:,2),'bdiamond' ...
        ,m(1,:), ENarray(1,:),'r-' ...
        ,m(1,:) , ENarray(2,:),'g-' ...
        ,m(1,:) , ENarray(3,:),'b-') ; 
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 1. The effect of \theta and T (\lambda_m_t_c =5\lambda_a, eventCreditUnit = 1 ) '])
ylabel('Average MTC Event Record (E[N])')
title('Expected number of MTC Event Record in one CDR')
legend('T=25t (sim)','T=50t (sim)','T=100t (sim)','T=25t (ana)','T=50t (ana)','T=100t (ana)')
set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);

%figure(2)
for i=1:3
  for ii=1:marraySize
      ECuarray(i,ii) = ComputeECu( m(ii) , lambda*lambda_unit , T(i) ) ;
   end
end



subplot(2,2,2) ;
Ecu=semilogx(Data_singleArrivalExpon_theta_25T(:,1) , Data_singleArrivalExpon_theta_25T(:,3),'rO' ...
        ,Data_singleArrivalExpon_theta_50T(:,1) , Data_singleArrivalExpon_theta_50T(:,3),'g*' ...
        ,Data_singleArrivalExpon_theta_100T(:,1) , Data_singleArrivalExpon_theta_100T(:,3),'bdiamond' ...
         ,m(1,:) , ECuarray(1,:),'r-' ...
        ,m(1,:) , ECuarray(2,:),'g-'...
        ,m(1,:) , ECuarray(3,:),'b-') ;
    
ylabel('E[C_u] (Unit: credit)')
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 2. The effect of \theta and T ( \lambda_m_t_c=5\lambda_a, eventCreditUnit = 1 ) '])
title('Expected number of unused reserved credit at the end of MECR operation ')
legend('T=25t (sim)','T=50t (sim)','T=100t (sim)','T=25t (ana)','T=50t (ana)','T=100t (ana)')
set(Ecu, 'linewidth', 2);
set(Ecu, 'MarkerSize', 8);



%figure(3)
for i=1:3
    for ii=1:marraySize
         ECruarray(i,ii) = ComputeECru( m(ii) , lambda*lambda_unit , T(i) ) ;
         fprintf('module2 (i,ii) = (%d,%d)\n',i,ii) 
    end
end

subplot(2,2,3) ;
Erc=semilogx(Data_singleArrivalExpon_theta_25T(:,1) , Data_singleArrivalExpon_theta_25T(:,4),'rO' ...
        ,Data_singleArrivalExpon_theta_50T(:,1) , Data_singleArrivalExpon_theta_50T(:,4),'g*' ...
        ,Data_singleArrivalExpon_theta_100T(:,1) , Data_singleArrivalExpon_theta_100T(:,4),'bdiamond' ...
        ,m(1,:) , ECruarray(1,:),'r-' ...
        ,m(1,:) , ECruarray(2,:),'g-'...
        ,m(1,:) , ECruarray(3,:),'b-') ;
xlabel(['\theta ( Unit: credits )' ,sprintf('\n\n'), ...
       'Fig. 3. The effect of \theta and T (\lambda_m_t_c=5\lambda_a, eventCreditUnit = 1, \lambda_u_s_e_r = \lambda_u )'])
           %\lambda_u = \lambda_user_unit
ylabel('E[C_r_u] (Unit: credits)')
title('Expected number of Random User Check the Unused Reserved Credits')
legend('T=25t (sim)','T=50t (sim)','T=100t (sim)','T=25t (ana)','T=50t (ana)','T=100t (ana)')
set(Erc, 'linewidth', 2);
set(Erc, 'MarkerSize', 8);



hold on