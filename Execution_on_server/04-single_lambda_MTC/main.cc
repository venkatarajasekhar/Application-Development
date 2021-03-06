#include <iostream>
using namespace std;
#include "e_list.h"
#include "event.h"
#include "random.h"
#include  "mydef.h"
#include <fstream>


#define         INVALID_TYPE    (-1)
#define         INVALID_TIME    (-1.0)
fstream file ;

void outputDataFormat(){
    
    file.open("Data_singleLambdaMTC.txt" , ios ::out | ios::trunc) ;
    file<<" "<<endl;
    file.close() ;
}


void outputDataMessage( double lambda_MTCscale , double totalN , int CCR_Initial_msg, int CCR_Terminate_msg , double E_N , double E_Cu ,double E_Crc ,  int randomCheckNum  , int BeConsumed_Num , int Recharge_Num){
    
    file.open("Data_singleLambdaMTC.txt" , ios ::out | ios::app) ;
    file<<lambda_MTCscale<<" "<<E_N<<" "<<E_Cu<<" "<<E_Crc<<" "<<totalN<<" "<<randomCheckNum<<" "<<BeConsumed_Num<<" "<<Recharge_Num<<" "<<CCR_Initial_msg<<" "<<CCR_Terminate_msg<<endl;
    file.close() ;
}



/*main*/
int main(int argc, char**argv) {
    //Create DATA format
    outputDataFormat() ;
    //Input m (parameter file)
    double lambda_MTCscale[x_axis] ; //Theta = m events' credit
    int x=0 ;
    file.open( "InputData_lambda_MTC.txt" , ios ::in) ;
        while ( !file.eof() ) {
                file >> lambda_MTCscale [x++] ;
            }
    file.close() ;
    
    /**************************************************************************************/
    /***********************************Simulation Start***********************************/
    /**************************************************************************************/
    
    
    for (int i = 0 ; i < x_axis ; i++ ) {
        
        /*Set initial value*/
        
        //Output array ;
        double E_N, E_Cu , E_Crc ;
        
        //Credit caculation parameter
        double Theta = m * c_mtc ;
        double totalC_u = 0 ;          //Total unused reserved credits
        double C_u = 0 ;           //The i-th  unused reserved credits
        double C_d = initCredit ;      //Total unused credit in user account
        double totalC_rc = 0 ; //Total unused credit in user account that generated by RANDOM_CHECK event
        double C_rc = 0 ;             //The unused credit at j-th RANDOM_CHECK event
        
        //Other parameter
        int N = 0 ;                //Total number of ARRIVAL events
        double totalN=0 ;
        int randomCheckNum = 0 ;                   //The number of RANDOM_CHECK events
        int k = 0 ;                   //The experiments iteration
        int expire_inElist = FALSE ;         // Check REPORTING event in the event list
        int CCR_Initial_msg = 0 ;
        int CCR_Terminate_msg = 0 ;
        int BeConsumed_Num = 0 ;
        int Recharge_Num = 0 ;
        int Event_Type_temp ;         //Put the getEventType()'s value
        int arrival_Type_temp ;
        int timerCounter = 0 ;
        //Inter arrival
        int seed1=(int)time(0) ;
        int seed2=(int)time(0) ;
        
        //Inter arrival time of ARRIVAL event
        Expon t_a1( seed1  , 1 / (lambda_MTCscale[i]*lambda_MTC_unit) ) ;
        Expon  t_rc( seed2 , 1 / lambda_user ) ;
        
        double timeStampNow = 0 ;
        double timeStampRandomCheck = 0 ;
        double timeStampTimerExpiry = 0 ;
        //Initial the event list
        E_List*  ptr;
        Event* node1 ;        //Reponsible for add new event to the event list
        Event* node2 ;        //Recycle the event that delete from the event list
        ptr  = new E_List;
        /***********************************************************************************/
        /***********************************************************************************/
        /***********************************************************************************/
        /***********************************************************************************/
        
        /*Generate the first ARRIVAL event*/
            node1 = new Event;
            node1->setTimestamp(timeStampNow + t_a1++);
            node1->setEventType(ARRIVAL);
            *ptr << *node1;
//cout << "\nThe list:\n" << *ptr << "\n";
        
        /*Generate the first RANDOM_CHECK event*/
            timeStampRandomCheck += t_rc++ ;
            node1 = new Event;
            node1->setTimestamp(timeStampRandomCheck);
            node1->setEventType(RANDOM_CHECK);
            *ptr << *node1;
//cout << "\nThe list:\n" << *ptr << "\n"<<"/**************************************/\n" ;
        
        
        while (cycle > k) {
            
             /*Execute the Next event in the event list*/
            
                if (!(*ptr)) {
                                cout << "The list is empty\n\n";
                    }else{
                            *ptr >> node2;         //Delete the frist event from the list and put it into the node2
                
                        //Get the deleted event's type
                            Event_Type_temp = node2->getEventType();
                            arrival_Type_temp = node2->getArrivalType() ;
                        //Check deleted event's time stamp
                            timeStampNow = node2->getTimeStamp() ;
//cout << "The Deleted node:\n" << *node2<< "\nThe list:\n" << *ptr << "\n" ;
                            delete node2;
                        }//if else
            
            /******************* Even type ? *******************/
            
            switch (Event_Type_temp) {
                    
                case ARRIVAL:
                    
                    if ( C_u >= Theta/m ) {
                        
                                /*Deduct the credits from unused reserved credits*/
                                C_u = C_u - (Theta/m) ;
                                N = N + 1 ;
                        /*Generate the next ARRIVAL event and insert it into the event list*/
                        
                        timeStampNow += t_a1++ ;
                        node1 = new Event;
                        node1->setTimestamp(timeStampNow);
                        node1->setEventType(ARRIVAL);
                        *ptr << *node1;
                        
//cout << "\n ARRIVAL:\n" << *ptr << "\n";
                        
                    } else {
                        
                        if (expire_inElist == TRUE) {
                            /* Generate the next CREDIT_CONSUMED event into event list */
                            node1 = new Event;
                            node1->setTimestamp(timeStampNow);
                            node1->setEventType(CREDIT_CONSUMED);
                            *ptr << *node1;
                            
                            /** Insert the  previous deleted ARRIVAL event into event list  **/
                            node1 = new Event;
                            node1->setTimestamp(timeStampNow);
                            node1->setEventType(ARRIVAL);
                            *ptr << *node1;
//cout << "\nCREDIT_CONSUMED :\n" << *ptr << "\n";
                            
                        } else {
                            /*Generate the next CREDIT_RESERVATION event and insert it into the event list*/
                            node1 = new Event;
                            node1->setTimestamp(timeStampNow);
                            node1->setEventType(CREDIT_RESERVATION);
                            *ptr << *node1;
                            
                            /** Insert the  previous deleted ARRIVAL event into event list  **/
                            node1 = new Event;
                            node1->setTimestamp(timeStampNow);
                            node1->setEventType(ARRIVAL);
                            *ptr << *node1;
//cout << "\nCREDIT_RESERVATION :\n" << *ptr << "\n";
                         }//if else expire_inElist == TRUE
                        
                    }//if else  C_u > Theta/m[i]
                    
                    break ;
                    
                case CREDIT_RESERVATION:
                    
                    /*Reserve credits operation*/
                    CCR_Initial_msg++ ;
                    
                    if (C_d < Theta) { C_d = initCredit ;
                        Recharge_Num++ ; }//Recharge
                    
                    C_d = C_d - Theta ;
                    C_u = Theta ;
                /* Generate the next TIMER_EXPIRY event and insert it into the event list */
                    node1 = new Event;
                    timeStampTimerExpiry = timeStampNow ;
                    timeStampTimerExpiry += t_expire ;
                    node1->setTimestamp(timeStampTimerExpiry);
                    node1->setEventType(TIMER_EXPIRY);
                    *ptr << *node1;
                    expire_inElist = TRUE ;
                    timerCounter++ ;
//cout << "\nTIMER EXPIRY :\n" << *ptr << "\n";
                    break ;
                    
                    
                case CREDIT_CONSUMED :
                    
                    CCR_Terminate_msg++ ;
                    expire_inElist = FALSE ;
                    k = k + 1 ; // iteration
                    totalN +=N;
                    N=0;
                    BeConsumed_Num ++ ;
                    break ;
                    
                case TIMER_EXPIRY :
                    
                    if (expire_inElist == TRUE && timerCounter==1) {
                        /*Record the unused reserved credits */
                        CCR_Terminate_msg++ ;
                        /*Total unused rserved credits*/
                        totalC_u = totalC_u + C_u ;
                        /*Return the credits to OCS*/
                        C_d = C_d + C_u ;
                        C_u = 0 ;
                        expire_inElist =FALSE ;
                        totalN +=N;
                        N=0;
                        k = k + 1 ;
                    }
                    timerCounter--;
                    break ;
                    
                case RANDOM_CHECK :
                    /* Record the unused reserved credits for random user check */
                    C_rc = C_u ; //just observe crediy not in user account
                    totalC_rc = totalC_rc + C_rc ;
                    randomCheckNum ++ ;
                    
                    /*Generate the next RANDOM CHECK event and insert it into the event list*/
                    timeStampRandomCheck += t_rc++ ;
                    node1 = new Event;
                    node1->setTimestamp(timeStampRandomCheck);
                    node1->setEventType(RANDOM_CHECK);
                    *ptr << *node1;
//cout << "\nRandom check :\n" << *ptr << "\n";
                    
                    break;
                    
                default:
                    break;
            }//switch
        }//while
        
        /*Compute the result*/
        
        cout<<"The cycle is "<<i+1<<" .\n" ;
        E_N = totalN / CCR_Terminate_msg ;
        E_Cu = totalC_u / CCR_Terminate_msg ;
        E_Crc = totalC_rc / randomCheckNum ;
        
        cout<<"The expected number of ARRIVAL event in a CDR : E[N] = "<<E_N<<endl ;
        cout<<"The expected number of unused reserved credits : E[C_u]= "<<E_Cu<<endl ;
        cout<<"Unused reserved credits at every RANDOM_CHECK event : E[C_rc] = "<<E_Crc<<endl ;
        
        outputDataMessage(lambda_MTCscale[i], totalN , CCR_Initial_msg, CCR_Terminate_msg , E_N , E_Cu , E_Crc , randomCheckNum  , BeConsumed_Num , Recharge_Num ) ;
    }//for x-axis
    
    
    return 0;
}


