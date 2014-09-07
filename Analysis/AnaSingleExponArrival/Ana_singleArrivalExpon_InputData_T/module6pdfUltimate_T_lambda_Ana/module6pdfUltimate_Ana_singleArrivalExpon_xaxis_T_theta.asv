clc
clear all
load Data_singleArrivalExpon_T_005lambda.txt ;
load Data_singleArrivalExpon_T_05lambda.txt ;
load Data_singleArrivalExpon_T_1lambda.txt ;
%figure(1)

format long e

m =60;    %Give Credits
lambda=[0.05 0.5 1]; 
T = [1 3 5 7 9 10 30 50 70 90 100 300 500 700 900 1000] ; %Timer
lambda_unit = 1 ;
TarraySize = 16 ;
lambdaSize=3;
ENarray = zeros(3,TarraySize) ;
ECuarray = zeros(3,TarraySize) ;
ECruarray = zeros(3,TarraySize) ;

%figure(1)
for i=1:lambdaSize
  for ii=1:TarraySize
      ENarray(i,ii) = ComputeEN(m , lambda(i)*lambda_unit , T(ii) ) ;
   end
end

figure(1)
subplot(2,2,1) ;

En = semilogx(Data_singleArrivalExpon_T_005lambda(:,1) , Data_singleArrivalExpon_T_005lambda(:,2),'rO' ...
        ,Data_singleArrivalExpon_T_05lambda(:,1) , Data_singleArrivalExpon_T_05lambda(:,2),'k*' ...
        ,Data_singleArrivalExpon_T_1lambda(:,1) , Data_singleArrivalExpon_T_1lambda(:,2),'bdiamond' ...
        ,T(1,:), ENarray(1,:),'r-' ...
        ,T(1,:) , ENarray(2,:),'k-.' ...
        ,T(1,:) , ENarray(3,:),'b--') ; 

   xen=xlabel(['T ( Unit: time unit )' ,sprintf('\n'), ...
       '(a) Expected Number of MTC Event Record in One CDR. '])
yen=ylabel('Average MTC records in one CDR (E[N])')
% legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
%        '\lambda_m_t_c=0.05 (ana)','\lambda_m_t_c=0.5
%        (ana)','\lambda_m_t_c=1 (ana)') ;
legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);
set(xen,'fontsize',12);
set(yen,'fontsize',12);


%figure(2)

for i=1:lambdaSize
  for ii=1:TarraySize
      ECuarray(i,ii) = ComputeECu( m , lambda(i)*lambda_unit , T(ii) ) ;
   end
end

subplot(2,2,2) ;
Ecu=semilogx(Data_singleArrivalExpon_T_005lambda(:,1) , Data_singleArrivalExpon_T_005lambda(:,3),'rO' ...
        ,Data_singleArrivalExpon_T_05lambda(:,1) , Data_singleArrivalExpon_T_05lambda(:,3),'k*' ...
        ,Data_singleArrivalExpon_T_1lambda(:,1) , Data_singleArrivalExpon_T_1lambda(:,3),'bdiamond' ...
        ,T(1,:) , ECuarray(1,:),'r-' ...
        ,T(1,:) , ECuarray(2,:),'k-.'...
        ,T(1,:) , ECuarray(3,:),'b--') ;
  xcu= xlabel(['T ( Unit: time unit )' ,sprintf('\n'), ...
       '(b) Expected amount of unused reserved credit units return to the OCS. ']);

ycu=ylabel('E[C_u] (Unit: credit unit)');
legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
% legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
%        '\lambda_m_t_c=0.05 (ana)','\lambda_m_t_c=0.5 (ana)','\lambda_m_t_c=1 (ana)') ;
set(Ecu, 'linewidth', 2);
set(Ecu, 'MarkerSize', 8);
set(xcu,'fontsize',12);
set(ycu,'fontsize',12);


%figure(3)

for i=1:lambdaSize
    for ii=1:TarraySize
        ECruarray(i,ii) = ComputeECru( m , lambda(i)*lambda_unit , T(ii) ) ;
         fprintf('module6 (i,ii) = (%d,%d)\n',i,ii) 
    end
end

subplot(2,2,3) ;
Erc=semilogx(Data_singleArrivalExpon_T_005lambda(:,1) , Data_singleArrivalExpon_T_005lambda(:,4),'rO' ...
        ,Data_singleArrivalExpon_T_05lambda(:,1) , Data_singleArrivalExpon_T_05lambda(:,4),'k*' ...
        ,Data_singleArrivalExpon_T_1lambda(:,1) , Data_singleArrivalExpon_T_1lambda(:,4),'bdiamond' ...
        ,T(1,:), ECruarray(1,:),'r-' ...
        ,T(1,:) , ECruarray(2,:),'k-.' ...
        ,T(1,:) , ECruarray(3,:),'b--') ; 
  xcru= xlabel(['T ( Unit: time unit )' ,sprintf('\n'), ...
       '(c) Expected amount of unused reserved credit units found at any random checkpoint. ']);

           %\lambda_u = \lambda_user_unit
ycru=ylabel('E[C_r_u] (Unit: credit unit)');
ECrulengend=legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
% legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
%        '\lambda_m_t_c=0.05 (ana)','\lambda_m_t_c=0.5 (ana)','\lambda_m_t_c=1 (ana)') ;
set(Erc, 'linewidth', 2);
set(Erc, 'MarkerSize', 8);
set(ECrulengend,'fontsize',7)
set(xcru,'fontsize',12);
set(ycru,'fontsize',12);
%%%%%%%%%%%%%%%%%%%%%%%Accuracy%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%declear%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorEN=zeros(TarraySize,lambdaSize);
errorECu=zeros(TarraySize,lambdaSize);
errorECru=zeros(TarraySize,lambdaSize);
coeofvarEN= zeros(1,lambdaSize);
coeofvarECu= zeros(1,lambdaSize);
%%%%%%%%%%%%%%%%%%%%%%compute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorEN(:,1)=abs(Data_singleArrivalExpon_T_005lambda(:,2)-ENarray(1,:)') ;
errorEN(:,2)=abs(Data_singleArrivalExpon_T_05lambda(:,2)-ENarray(2,:)')  ;
errorEN(:,3)=abs(Data_singleArrivalExpon_T_1lambda(:,2)-ENarray(3,:)' )   ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorECu(:,1)=abs(Data_singleArrivalExpon_T_005lambda(:,3)-ECuarray(1,:)') ;
errorECu(:,2)=abs(Data_singleArrivalExpon_T_05lambda(:,3)-ECuarray(2,:)') ;
errorECu(:,3)=abs(Data_singleArrivalExpon_T_1lambda(:,3)-ECuarray(3,:)' ) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorECru(:,1)=abs(Data_singleArrivalExpon_T_005lambda(:,4)-ECruarray(1,:)') ./ECruarray(1,:)' ;
errorECru(:,2)=abs(Data_singleArrivalExpon_T_05lambda(:,4)-ECruarray(2,:)' ) ./ECruarray(2,:)' ;
errorECru(:,3)=abs(Data_singleArrivalExpon_T_1lambda(:,4)-ECruarray(3,:)')  ./ECruarray(3,:)' ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%message reduction%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)
CCRreductionSim = zeros(TarraySize,lambdaSize) ;
CCRReductionAna= zeros(TarraySize,lambdaSize) ;
CCRreductionSim(:,1)=(Data_singleArrivalExpon_T_005lambda(:,2)-1)./Data_singleArrivalExpon_T_005lambda(:,2) .*100;
CCRreductionSim(:,2)=(Data_singleArrivalExpon_T_05lambda(:,2)-1)./Data_singleArrivalExpon_T_05lambda(:,2) .*100;
CCRreductionSim(:,3)=(Data_singleArrivalExpon_T_1lambda(:,2)-1)./Data_singleArrivalExpon_T_1lambda(:,2) .*100;
CCRreductionAna(:,1)=(ENarray(1,:)'-1)./ENarray(1,:)' .*100;
CCRreductionAna(:,2)=(ENarray(2,:)'-1)./ENarray(2,:)'.*100 ;
CCRreductionAna(:,3)=(ENarray(3,:)'-1)./ENarray(3,:)' .*100;
CCRplot = semilogx(Data_singleArrivalExpon_T_005lambda(:,1) , CCRreductionSim(:,1),'rO' ...
              ,Data_singleArrivalExpon_T_05lambda(:,1) , CCRreductionSim(:,2),'k*' ...
              ,Data_singleArrivalExpon_T_1lambda(:,1) , CCRreductionSim(:,3),'bdiamond'  ...
               ,T(:), CCRreductionAna(:,1),'r-' ...
              ,T(:),CCRreductionAna(:,2),'k-.' ...
              ,T(:),CCRreductionAna(:,3),'b--') ;   

 xccr=xlabel(['T ( Unit: time unit )' ,sprintf('\n'), ...
       '(d) CCR Message Reduction']);
yccr=ylabel('CCR Message Reduction (Unit: %)');
legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
 %legend('\lambda=0.05','\lambda=0.5 ','\lambda=1 ') ;

set(CCRplot, 'linewidth', 2);
set(CCRplot, 'MarkerSize', 8);
set(xccr,'fontsize',12);
set(yccr,'fontsize',12);
% figure(2)
% CCRreductionSim = zeros(TarraySize,lambdaSize) ;
% CCRreductionAna = zeros(TarraySize,lambdaSize) ;
% 
% CCRreductionSim(:,1)=(Data_singleArrivalExpon_T_005lambda(:,2)-1)./Data_singleArrivalExpon_T_005lambda(:,2) .*100;
% CCRreductionSim(:,2)=(Data_singleArrivalExpon_T_05lambda(:,2)-1)./Data_singleArrivalExpon_T_05lambda(:,2) .*100;
% CCRreductionSim(:,3)=(Data_singleArrivalExpon_T_1lambda(:,2)-1)./Data_singleArrivalExpon_T_1lambda(:,2) .*100;
% CCRreductionAna(:,1)=(ENarray(1,:)'-1)./ENarray(1,:)' .*100;
% CCRreductionAna(:,2)=(ENarray(2,:)'-1)./ENarray(2,:)' .*100;
% CCRreductionAna(:,3)=(ENarray(3,:)'-1)./ENarray(3,:)' .*100;
% 
% CCRplot = semilogx(Data_singleArrivalExpon_T_005lambda(:,1) , CCRreductionSim(:,1),'rO' ...
%               ,Data_singleArrivalExpon_T_05lambda(:,1) , CCRreductionSim(:,2),'k*' ...
%               ,Data_singleArrivalExpon_T_1lambda(:,1) , CCRreductionSim(:,3),'bdiamond' ...
%               ,T(:), CCRreductionAna(:,1),'r-' ...
%               ,T(:) , CCRreductionAna(:,2),'k-.' ...
%               ,T(:) , CCRreductionAna(:,3),'b--') ;  
% 
%  xlabel(['T ( Unit: time unit )' ,sprintf('\n'), ...
%        '(a) CCR Message Reduction (m=30) '])
% ylabel('CCR Message Reduction (Unit: %)')
%  legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
%        '\lambda_m_t_c=0.05 (ana)','\lambda_m_t_c=0.5 (ana)','\lambda_m_t_c=1 (ana)') ;
% 
% set(CCRplot, 'linewidth', 2);
% set(CCRplot, 'MarkerSize', 8);

hold on