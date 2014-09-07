function prob=P_mecr(i, m, lambda, T)
prob = 0 ;
prob= P_1(i, m,lambda,T)*(1- sumPoisson( 0,m-2,lambda,T ) ) + P_2(i,m,lambda,T) *  sumPoisson( 0,m-2,lambda,T )   ;

end

%prob= P_1(i, m,lambda,T,tmStar(m,lambda,T)+E_tau0(lambda,T))*(1- sumPoisson( 0,m-2,lambda,T ) ) + P_2(i,m,lambda,T,T+E_tau0(lambda,T)) *  sumPoisson( 0,m-2,lambda,T )   ;
