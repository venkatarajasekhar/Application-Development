clc
clear all
load Data_singleArrivalExpon_T_theta20.txt ;
load Data_singleArrivalExpon_T_theta30.txt ;
load Data_singleArrivalExpon_T_theta40.txt ;

format long e

m =[20 30 40];    %Give Credits
lambda=5; 
T = [1 3 5 7 9 10 30 50 70 90 100 300 500 700 900 1000 3000 5000 7000 10000] ; %Timer
lambda_unit = 0.1 ;
TarraySize = 20 ;
ENarray = zeros(3,TarraySize) ;
ECuarray = zeros(3,TarraySize) ;
ECruarray = zeros(3,TarraySize) ;

%figure(1)
for i=1:3
  for ii=1:TarraySize
      ENarray(i,ii) = ComputeEN(m(i) , lambda*lambda_unit , T(ii) ) ;
   end
end

subplot(2,2,1) ;
En = semilogx(Data_singleArrivalExpon_T_theta20(:,1) , Data_singleArrivalExpon_T_theta20(:,2),'rO' ...
        ,Data_singleArrivalExpon_T_theta30(:,1) , Data_singleArrivalExpon_T_theta30(:,2),'g*' ...
        ,Data_singleArrivalExpon_T_theta40(:,1) , Data_singleArrivalExpon_T_theta40(:,2),'bdiamond' ...
        ,T(1,:), ENarray(1,:),'r-' ...
        ,T(1,:) , ENarray(2,:),'g-' ...
        ,T(1,:) , ENarray(3,:),'b-') ; 
xlabel(['T ( Unit: time unit )' ,sprintf('\n\n'), ...
       'Fig. 1. The effect of T and \theta ( \lambda_m_t_c=5\lambda_a, eventCreditUnit = 1 ) '])
ylabel('Average MTC Event Record (E[N])')
title('Expected number of MTC Event Record in one CDR')
legend('\theta=20c (sim)','\theta=30c (sim)','\theta=40c (sim)','\theta=20c (ana)','\theta=30c (ana)','\theta=40c (ana)')
set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);



%figure(2)

for i=1:3
  for ii=1:TarraySize
      ECuarray(i,ii) = ComputeECu( m(i) , lambda*lambda_unit , T(ii) ) ;
   end
end

subplot(2,2,2) ;
Ecu=semilogx(Data_singleArrivalExpon_T_theta20(:,1) , Data_singleArrivalExpon_T_theta20(:,3),'rO' ...
        ,Data_singleArrivalExpon_T_theta30(:,1) , Data_singleArrivalExpon_T_theta30(:,3),'g*' ...
        ,Data_singleArrivalExpon_T_theta40(:,1) , Data_singleArrivalExpon_T_theta40(:,3),'bdiamond'...
        ,T(1,:), ECuarray(1,:),'r-' ...
        ,T(1,:) , ECuarray(2,:),'g-' ...
        ,T(1,:) , ECuarray(3,:),'b-') ; 
xlabel(['T ( Unit: time unit )' ,sprintf('\n\n'), ...
       'Fig. 2. The effect of T and \theta ( \lambda_m_t_c=5\lambda_a, eventCreditUnit = 1 ) '])

ylabel('E[C_u] (Unit: credit)')
title('Expected Number of Unused Reserved Credits at the end of MECR operation')
legend('\theta=20c (sim)','\theta=30c (sim)','\theta=40c (sim)','\theta=20c (ana)','\theta=30c (ana)','\theta=40c (ana)')
set(Ecu, 'linewidth', 2);
set(Ecu, 'MarkerSize', 8);



%figure(3)

for i=1:3
    for ii=1:TarraySize
        ECruarray(i,ii) = ComputeECru( m(i) , lambda*lambda_unit , T(ii) ) ;
         fprintf('module5 (i,ii) = (%d,%d)\n',i,ii) 
    end
end
subplot(2,2,3) ;
Erc=semilogx(Data_singleArrivalExpon_T_theta20(:,1) , Data_singleArrivalExpon_T_theta20(:,4),'rO' ...
        ,Data_singleArrivalExpon_T_theta30(:,1) , Data_singleArrivalExpon_T_theta30(:,4),'g*' ...
        ,Data_singleArrivalExpon_T_theta40(:,1) , Data_singleArrivalExpon_T_theta40(:,4),'bdiamond' ...
        ,T(1,:), ECruarray(1,:),'r-' ...
        ,T(1,:) , ECruarray(2,:),'g-' ...
        ,T(1,:) , ECruarray(3,:),'b-') ; 
xlabel(['T ( Unit: time unit )' ,sprintf('\n\n'), ...
       'Fig. 3. The effect of T and \theta ( \lambda_m_t_c=5\lambda_a, eventCreditUnit = 1 ,\lambda_u_s_e_r = \lambda_u ) '])

           %\lambda_u = \lambda_user_unit
ylabel('E[C_r_u] (Unit: credits)')
title('Expected number of Random User Check Unused Reserved Credits')

legend('\theta=20c (sim)','\theta=30c (sim)','\theta=40c (sim)','\theta=20c (ana)','\theta=30c (ana)','\theta=40c (ana)')
set(Erc, 'linewidth', 2);
set(Erc, 'MarkerSize', 8);


hold on