clc
clear all
load Data_singleArrivalExpon_theta_005lambdaMTC.txt ;
load Data_singleArrivalExpon_theta_05lambdaMTC.txt ;
load Data_singleArrivalExpon_theta_1lambdaMTC.txt ;
%figure(1)

format long e

m =[1 3 5 7 9 10 20 30 40 50 60 70 80 90 100];    %Give Credits
lambda=[0.05 0.5 1]; 
T = 50 ; %Timer
lambda_unit = 1 ;
mSize = 15;
lambdaSize = 3 ;
ENarray = zeros(mSize,3) ;
ECuarray = zeros(3,mSize) ;
ECruarray = zeros(3,mSize) ;
for i=1:lambdaSize
  for ii=1:mSize
      ENarray(ii,i) = ComputeEN(m(ii) , lambda(i)*lambda_unit , T ) ;
   end
end

figure(1)
subplot(2,2,1) ;


En = semilogx(Data_singleArrivalExpon_theta_005lambdaMTC(:,1) , Data_singleArrivalExpon_theta_005lambdaMTC(:,2),'rO' ...
        ,Data_singleArrivalExpon_theta_05lambdaMTC(:,1) , Data_singleArrivalExpon_theta_05lambdaMTC(:,2),'k*' ...
        ,Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , Data_singleArrivalExpon_theta_1lambdaMTC(:,2),'bdiamond' ...
        ,m(1,:), ENarray(:,1),'r-' ...
        ,m(1,:) , ENarray(:,2),'k-.' ...
        ,m(1,:) , ENarray(:,3),'b--') ; 
  xen= xlabel(['\theta ( Unit: credit unit )' ,sprintf('\n'), ...
       '(a) Expected Number of MTC Event Record in One CDR. ']);
yen=ylabel('Average MTC Event Record (E[N])');

legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
set(En, 'linewidth', 2);
set(En, 'MarkerSize', 8);
set(xen,'fontsize',12);
set(yen,'fontsize',12);

%figure(2)

for i=1:lambdaSize
  for ii=1:mSize
      ECuarray(i,ii) = ComputeECu( m(ii) , lambda(i)*lambda_unit , T ) ;
   end
end



subplot(2,2,2) ;
Ecu=semilogx(Data_singleArrivalExpon_theta_005lambdaMTC(:,1) , Data_singleArrivalExpon_theta_005lambdaMTC(:,3),'rO' ...
        ,Data_singleArrivalExpon_theta_05lambdaMTC(:,1) , Data_singleArrivalExpon_theta_05lambdaMTC(:,3),'k*' ...
        ,Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , Data_singleArrivalExpon_theta_1lambdaMTC(:,3),'bdiamond' ...
        ,m(1,:) , ECuarray(1,:),'r-' ...
        ,m(1,:) , ECuarray(2,:),'k-.'...
        ,m(1,:) , ECuarray(3,:),'b--') ;
    
ycu=ylabel('E[C_u] (Unit: credit unit)');
xcu=xlabel(['\theta ( Unit: credit unit )' ,sprintf('\n'), ...
       '(b) Expected amount of unused reserved credit units return to the OCS.']);
% legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
%        '\lambda_m_t_c=0.05 (ana)','\lambda_m_t_c=0.5 (ana)','\lambda_m_t_c=1 (ana)') ;
legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
set(Ecu, 'linewidth', 2);
set(Ecu, 'MarkerSize', 8);
set(xcu,'fontsize',12);
set(ycu,'fontsize',12);


%figure(3)

for i=1:lambdaSize
  for ii=1:mSize
      ECruarray(i,ii) = ComputeECru( m(ii) , lambda(i)*lambda_unit , T ) ;
      fprintf('module1 (i,ii) = (%d,%d)\n',i,ii) 
  end
end


subplot(2,2,3) ;
Erc=semilogx(Data_singleArrivalExpon_theta_005lambdaMTC(:,1) , Data_singleArrivalExpon_theta_005lambdaMTC(:,4),'rO' ...
        ,Data_singleArrivalExpon_theta_05lambdaMTC(:,1) , Data_singleArrivalExpon_theta_05lambdaMTC(:,4),'k*' ...
        ,Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , Data_singleArrivalExpon_theta_1lambdaMTC(:,4),'bdiamond' ...
         ,m(1,:) , ECruarray(1,:),'r-' ...
        ,m(1,:) , ECruarray(2,:),'k-.'...
        ,m(1,:) , ECruarray(3,:),'b--') ;
xcru=xlabel(['\theta ( Unit: credit unit )' ,sprintf('\n'), ...
       '(c)  Expected amount of unused reserved credit units found at any random checkpoint.']);
           %Average random check number of obsevers
           %, \lambda_u_s_e_r = 0.01  random number of obsever/time units
ycru=ylabel('E[C_r_u] (Unit: credit unit)');

% legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
set(Erc, 'linewidth', 2);
set(Erc, 'MarkerSize', 8);
set(xcru,'fontsize',12);
set(ycru,'fontsize',12);
%%%%%%%%%%%%%%%%%%%%%%%Accuracy%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%declear%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorEN=zeros(mSize,lambdaSize);
errorECu=zeros(mSize,lambdaSize);
errorECru=zeros(mSize,lambdaSize);
coeofvarEN= zeros(1,lambdaSize);
coeofvarECu= zeros(1,lambdaSize);
%%%%%%%%%%%%%%%%%%%%%%compute%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorEN(:,1)=abs(Data_singleArrivalExpon_theta_005lambdaMTC(:,2)-ENarray(:,1))   ;
errorEN(:,2)=abs(Data_singleArrivalExpon_theta_05lambdaMTC(:,2)-ENarray(:,2))  ;
errorEN(:,3)=abs(Data_singleArrivalExpon_theta_1lambdaMTC(:,2)-ENarray(:,3) )   ;
stdEN=std(errorEN) ;
meanEN= mean(errorEN) ;
coeofvarEN=abs(stdEN./meanEN)*100 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorECu(:,1)=abs(Data_singleArrivalExpon_theta_005lambdaMTC(:,3)-ECuarray(1,:)') ;
errorECu(:,2)=abs(Data_singleArrivalExpon_theta_05lambdaMTC(:,3)-ECuarray(2,:)') ;
errorECu(:,3)=abs(Data_singleArrivalExpon_theta_1lambdaMTC(:,3)-ECuarray(3,:)' );
stdECu=std(errorECu) ;
meanECu= mean(errorECu) ;
coeofvarECu=abs(stdECu./meanECu) *100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errorECru(:,1)=abs(Data_singleArrivalExpon_theta_005lambdaMTC(:,4)-ECruarray(1,:)') ./ECruarray(1,:)'  ;
errorECru(:,2)=abs(Data_singleArrivalExpon_theta_05lambdaMTC(:,4)-ECruarray(2,:)' )./ECruarray(2,:)' ;
errorECru(:,3)=abs(Data_singleArrivalExpon_theta_1lambdaMTC(:,4)-ECruarray(3,:)') ./ECruarray(3,:)' ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%CCR message reduction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)
CCRreductionSim = zeros(mSize,lambdaSize) ;
CCRreductionAna = zeros(mSize,lambdaSize) ;
CCRreductionSim(:,1)=(Data_singleArrivalExpon_theta_005lambdaMTC(:,2)-1)./Data_singleArrivalExpon_theta_005lambdaMTC(:,2) .*100;
CCRreductionSim(:,2)=(Data_singleArrivalExpon_theta_05lambdaMTC(:,2)-1)./Data_singleArrivalExpon_theta_05lambdaMTC(:,2) .*100;
CCRreductionSim(:,3)=(Data_singleArrivalExpon_theta_1lambdaMTC(:,2)-1)./Data_singleArrivalExpon_theta_1lambdaMTC(:,2) .*100;
CCRreductionAna(:,1)=(ENarray(:,1)-1  )./ENarray(:,1) .*100;
CCRreductionAna(:,2)=(ENarray(:,2)-1)./ENarray(:,2) .*100;
CCRreductionAna(:,3)=(ENarray(:,3)-1)./ENarray(:,3) .*100;
CCRplot = semilogx(Data_singleArrivalExpon_theta_005lambdaMTC(:,1) , CCRreductionSim(:,1),'r-O' ...
              ,Data_singleArrivalExpon_theta_05lambdaMTC(:,1) , CCRreductionSim(:,2),'k-.*' ...
              ,Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , CCRreductionSim(:,3),'b--diamond' ...
               ,m(:), CCRreductionAna(:,1),'r-' ...
               ,m(:) , CCRreductionAna(:,2),'k-.' ...
               ,m(:) , CCRreductionAna(:,3),'b--') ;   

xccr= xlabel(['\theta ( Unit: credit unit )' ,sprintf('\n'), ...
       '(d) CCR Message Reduction']);
yccr=ylabel('CCR Message Reduction (Unit: %)');
 %legend('\lambda=0.05 ','\lambda=0.5 ','\lambda=1 ') ;
legend('\lambda=0.05 (sim)','\lambda=0.5 (sim)','\lambda=1 (sim)', ...
       '\lambda=0.05 (ana)','\lambda=0.5 (ana)','\lambda=1 (ana)') ;
set(CCRplot, 'linewidth', 2);
set(CCRplot, 'MarkerSize', 8);
set(xccr,'fontsize',12);
set(yccr,'fontsize',12);
% figure(2)
% CCRreductionSim = zeros(mSize,lambdaSize) ;
% CCRreductionAna = zeros(mSize,lambdaSize) ;
% 
% CCRreductionSim(:,1)=(Data_singleArrivalExpon_theta_005lambdaMTC(:,2)-1)./Data_singleArrivalExpon_theta_005lambdaMTC(:,2) .*100;
% CCRreductionSim(:,2)=(Data_singleArrivalExpon_theta_05lambdaMTC(:,2)-1)./Data_singleArrivalExpon_theta_05lambdaMTC(:,2) .*100;
% CCRreductionSim(:,3)=(Data_singleArrivalExpon_theta_1lambdaMTC(:,2)-1)./Data_singleArrivalExpon_theta_1lambdaMTC(:,2) .*100;
% CCRreductionAna(:,1)=(ENarray(:,1)-1  )./ENarray(:,1) .*100;
% CCRreductionAna(:,2)=(ENarray(:,2)-1)./ENarray(:,2) .*100;
% CCRreductionAna(:,3)=(ENarray(:,3)-1)./ENarray(:,3) .*100;
% CCRplot = semilogx(Data_singleArrivalExpon_theta_005lambdaMTC(:,1) , CCRreductionSim(:,1),'rO' ...
%               ,Data_singleArrivalExpon_theta_05lambdaMTC(:,1) , CCRreductionSim(:,2),'k*' ...
%               ,Data_singleArrivalExpon_theta_1lambdaMTC(:,1) , CCRreductionSim(:,3),'bdiamond' ...
%               ,m(1,:), CCRreductionAna(:,1),'r-' ...
%               ,m(1,:) , CCRreductionAna(:,2),'k-.' ...
%               ,m(1,:) , CCRreductionAna(:,3),'b--') ;  
% 
%  xlabel(['\theta ( Unit: credit unit )' ,sprintf('\n'), ...
%        'CCR Message Reduction '])
% ylabel('CCR Message Reduction (Unit: %)')
%  legend('\lambda_m_t_c=0.05 (sim)','\lambda_m_t_c=0.5 (sim)','\lambda_m_t_c=1 (sim)', ...
%        '\lambda_m_t_c=0.05 (ana)','\lambda_m_t_c=0.5 (ana)','\lambda_m_t_c=1 (ana)') ;
% 
% set(CCRplot, 'linewidth', 2);
% set(CCRplot, 'MarkerSize', 8);



hold on