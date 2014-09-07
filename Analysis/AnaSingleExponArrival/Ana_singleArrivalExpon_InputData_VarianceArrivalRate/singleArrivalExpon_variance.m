clc
clear all
load Data_singleArrivalExpon_variance_theta15.txt ;
load Data_singleArrivalExpon_variance_theta30.txt ;
load Data_singleArrivalExpon_variance_theta60.txt ;
%figure(1)
varianceSize = 21 ;
mSize = 3 ;  %m=15 30 60
             %T = 50 ;
Data_group1 =  Data_singleArrivalExpon_variance_theta15(:,1:4) ;
Data_group2 =  Data_singleArrivalExpon_variance_theta30(:,1:4) ;
Data_group3 =  Data_singleArrivalExpon_variance_theta60(:,1:4) ;
figure(1)
subplot(2,2,1) ;


En = semilogx(Data_group1(:,1) , Data_group1(:,2),'r-O' ...
        ,Data_group2(:,1) ,Data_group2(:,2),'k-.*' ...
        ,Data_group3(:,1) , Data_group3(:,2),'b--diamond' ) ; 
        xen= xlabel(['Variance V ( Unit: 1/\lambda^2 )' ,sprintf('\n'), ...
                      '(a) Expected Number of MTC Event Record in One CDR. ']);
        yen=ylabel('Average MTC Event Record (E[N])');

        legend('m=15 ','m=30 ','m=60 ') ;
        set(En, 'linewidth', 2);
        set(En, 'MarkerSize', 8);
        set(xen,'fontsize',12);
        set(yen,'fontsize',12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure(2)
subplot(2,2,2) ;
Ecu=semilogx(Data_group1(:,1) , Data_group1(:,3),'r-O' ...
        ,Data_group2(:,1) ,Data_group2(:,3),'k-.*' ...
        ,Data_group3(:,1) , Data_group3(:,3),'b--diamond' ) ;
    
        ycu=ylabel('E[C_u] (Unit: credit unit)');
        xcu=xlabel(['Variance V ( Unit: 1/\lambda^2 )' ,sprintf('\n'), ...
                       '(b) Expected amount of unused reserved credit units return to the OCS.']);
        legend('m=15 ','m=30 ','m=60 ') ;
        set(Ecu, 'linewidth', 2);
        set(Ecu, 'MarkerSize', 8);
        set(xcu,'fontsize',12);
        set(ycu,'fontsize',12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure(3)
subplot(2,2,3) ;
Eru=semilogx(Data_group1(:,1) , Data_group1(:,4),'r-O' ...
            ,Data_group2(:,1) ,Data_group2(:,4),'k-.*' ...
            ,Data_group3(:,1) , Data_group3(:,4),'b--diamond' ) ;
      xcru=xlabel(['Variance V ( Unit: 1/\lambda^2 )' ,sprintf('\n'), ...
                    '(c)  Expected amount of unused reserved credit units found at any random checkpoint.']);
      ycru=ylabel('E[C_r_u] (Unit: credit unit)');
      legend('m=15 ','m=30 ','m=60 ') ;
      set(Eru, 'linewidth', 2);
      set(Eru, 'MarkerSize', 8);
      set(xcru,'fontsize',12);
      set(ycru,'fontsize',12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%CCR message reduction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)
CCRreductionSim = zeros(varianceSize,mSize) ;
CCRreductionSim(:,1)=(Data_group1(:,2)-1)./Data_group1(:,2) .*100;
CCRreductionSim(:,2)=(Data_group2(:,2)-1)./Data_group2(:,2) .*100;
CCRreductionSim(:,3)=(Data_group3(:,2)-1)./Data_group3(:,2) .*100;
CCRplot = semilogx(Data_group1(:,1) , CCRreductionSim(:,1),'r-O' ...
              ,Data_group2(:,1) , CCRreductionSim(:,2),'k-.*' ...
              ,Data_group3(:,1) , CCRreductionSim(:,3),'b--diamond' ) ;   

       xccr= xlabel(['Variance V ( Unit: 1/\lambda^2 )' ,sprintf('\n'), ...
                     '(d) CCR Message Reduction']);
       yccr=ylabel('CCR Message Reduction (Unit: %)');
 
        legend('m=15 ','m=30 ','m=60 ') ;
       set(CCRplot, 'linewidth', 2);
       set(CCRplot, 'MarkerSize', 8);
       set(xccr,'fontsize',12);
       set(yccr,'fontsize',12);


hold on