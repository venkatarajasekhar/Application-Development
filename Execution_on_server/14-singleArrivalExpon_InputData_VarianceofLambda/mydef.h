//Notation
#define         TRUE           1
#define         FALSE          0
#define   cycle          1000000       
#define   x_axis         21

//Timer definition
#define time_unit         1
#define   t_expire        50 * time_unit //Reporting time period for REPORTING event



//Credit Information
#define  c_mtc                 1
#define  m                     15             //Theta = m events' credit

//Arrival Traffic
#define  lambda_MTC_unit           1


//Random user check
#define  lambda_user_unit             1           //Random_check arrival rate
#define  lambda_user_scale            0.1
#define  lambda_user                  lambda_user_unit * lambda_user_scale

//Specific define each event type
#define		ARRIVAL             1
#define		CREDIT_RESERVATION  2 //CCR_Initial
#define     CREDIT_CONSUMED     3 //CCR_Terminate
#define		TIMER_EXPIRY    	4 //CCR_Validity_Timer
#define		RANDOM_CHECK    	5


