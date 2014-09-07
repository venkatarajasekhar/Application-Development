clc
clear all
load Data_singleLambdaMTC_25T.txt ;
load Data_singleLambdaMTC_50T.txt ;
load Data_singleLambdaMTC_100T.txt ;


format long e

m =30;    %Give Credits
lambda=[0.01 0.05 0.1 0.5 1 3 5 7 9 10 30 50 70 90 100]; 
lambda2=[0.01 0.05 0.1 0.5 1 3 5 7 9 10 30 50 70 90 100];
T = [25 50 100] ; %Timer
T2 = [25 50 100] ;
lambda_unit = 0.1 ;
arraySize = 15 ;
arraySize2 =15 ;
T2Size =3 ;
ENarray = zeros(3,arraySize) ;
ECuarray = zeros(3,arraySize) ;
ECruarray = zeros(T2Size , arraySize2) ;


%figure(1)%
for i=1:3
  for ii=1:arraySize
      ENarray(i,ii) = ComputeEN(m , lambda(ii)*lambda_unit , T(i) ) ;
   end
end

subplot(2,2,1) ;
En = semilogx(Data_singleLambdaMTC_25T(1:15,1) , Data_singleLambdaMTC_25T(1:15,2),'rO' ...
        ,Data_singleLambdaMTC_50T(1:15,1) , Data_singleLambdaMTC_50T(1:15,2),'g*' ...
        ,Data_singleLambdaMTC_100T(1:15,1) , Data_singleLambdaMTC_100T(1:15,2),'bdiamond' ...
        ,lambda(1,:), ENarray(1,:),'r-' ...
        ,lambda(1,:) , ENarray(2,:),'g-' ...
        ,lambda(1,:) , ENarray(3,:),'b-') ; 
xlabel(['\lambda_m_t_c ( Unit:\lambda_a )' ,sprintf('\n\n'), ...
       'Fig. 1. The effect of T and \lambda_m_t_c ( \theta = 30c, eventCreditUnit = 1 ) '])
ylabel('Average MTC Event Record (E[N])')
title('Expected number of MTC Event Record in one CDR')
legend('T=25t (sim)','T=50t (sim)','T=100t (sim)','T=25t (ana)','T=50t (ana)','T=100t (ana)')
set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);



%figure(2)%
for i=1:3
  for ii=1:arraySize
      ECuarray(i,ii) = ComputeECu( m , lambda(ii)*lambda_unit , T(i) ) ;
   end
end

subplot(2,2,2) ;
Ecu=semilogx(Data_singleLambdaMTC_25T(1:15,1) , Data_singleLambdaMTC_25T(1:15,3),'rO' ...
        ,Data_singleLambdaMTC_50T(1:15,1) , Data_singleLambdaMTC_50T(1:15,3),'g*' ...
        ,Data_singleLambdaMTC_100T(1:15,1) , Data_singleLambdaMTC_100T(1:15,3),'bdiamond' ...
         ,lambda(1,:), ECuarray(1,:),'r-' ...
        ,lambda(1,:) , ECuarray(2,:),'g-' ...
        ,lambda(1,:) , ECuarray(3,:),'b-') ; 
xlabel(['\lambda_m_t_c ( Unit:\lambda_a )' ,sprintf('\n\n'), ...
       'Fig. 2. The effect of T and \lambda_m_t_c ( \theta = 30c, eventCreditUnit = 1 ) '])
ylabel('E[C_u] (Unit: credit)')
title('Expected number of unused reserved credit at the end of MECR operation ')
legend('T=25t (sim)','T=50t (sim)','T=100t (sim)','T=25t (ana)','T=50t (ana)','T=100t (ana)')
set(Ecu, 'linewidth', 2);
set(Ecu, 'MarkerSize', 8);



%figure(3)

for i=1:T2Size
    for ii=1:arraySize2
        ECruarray(i,ii) = ComputeECru( m , lambda2(ii)*lambda_unit , T2(i) ) ;
         fprintf('module4 (i,ii) = (%d,%d)\n',i,ii) 
    end
end


subplot(2,2,3) ;
Erc=semilogx(Data_singleLambdaMTC_25T(1:15,1) , Data_singleLambdaMTC_25T(1:15,4),'rO' ...
        ,Data_singleLambdaMTC_50T(1:15,1) , Data_singleLambdaMTC_50T(1:15,4),'g*' ...
        ,Data_singleLambdaMTC_100T(1:15,1) , Data_singleLambdaMTC_100T(1:15,4),'bdiamond' ...
        ,lambda2(1,:), ECruarray(1,:),'r-' ...
        ,lambda2(1,:) , ECruarray(2,:),'g-' ...
        ,lambda2(1,:) , ECruarray(3,:),'b-') ; 
    
xlabel(['\lambda_m_t_c ( Unit: \lambda_a )' ,sprintf('\n\n'), ...          %\lambda_a = \lambda_mtc_unit
       'Fig. 3. The effect of T and \lambda_m_t_c (  \theta = 30c, eventCreditUnit = 1, \lambda_u_s_e_r = \lambda_u )'])
           %\lambda_u = \lambda_user_unit
ylabel('E[C_r_u] (Unit: credits)')
title('Expected number of Random User Check Unused Reserved Credits')
legend('T=25t (sim)','T=50t (sim)','T=100t (sim)','T=25t (ana)','T=50t (ana)','T=100t (ana)')
set(Erc, 'linewidth', 2);
set(Erc, 'MarkerSize', 8);


hold on