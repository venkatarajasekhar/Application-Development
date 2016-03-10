#ifndef         _EVENT_H  
#define         _EVENT_H

#define         INVALID_TYPE    (-1)
#define         INVALID_TIME    (-1.0)

#include <iostream>
#include <stdio.h>
#include <time.h>       /* time_t, time, ctime */
using namespace std;

#include        <stdlib.h>
#include        "mydef.h"

  return 0;
}

class Event {
 private:
        int                eventType;    /* eventType=1 for ARRIVAL,=2 for CREDIT_RESERVATION ,=3 for CREDIT_CONSUMED , =4 RANDOM_CHECK*/
        string             timeStamp;      /* event time stamp             */
        int                arrivalType ;
        Event*             next;           /* pointer to next event node   */
        static Event*      freeList;       /* pointer to free event list   */
        
 public:
        Event() { eventType=0; /* constructor  */
                  timeStamp = ctime(&timestamp);;
                  arrivalType = 0 ;
                  next      = NULL;
                }
        Event(const int,const double ,const int);
                   
        void    initNode( const int,
                          const double, /* event node initialization    */
                          const int
                         ); /*  setup timestamp,old     */
        void    insNext( Event*);       /* insert the event node next   */
                                        /*  to the current node         */
        void    delNext();              /* delete the event node next   */
                                        /*  to the current node         */
        Event*  getNext()               /* get the pointer to the next  */
                { return next; }        /*  event node                  */
        string  getTimeStamp()      /* get the timestamp of current node*/
                { return timeStamp; }
       
        int     getEventType() {return eventType;}
        int     getArrivalType(){return arrivalType;}
        
        void  setEventType(int t) {eventType=t; }
        void  setarrivalType(int s){arrivalType=s;}    /* set arrivalType      */
        void  setTimestamp(string t)        /* set timestamp             */
              { timeStamp=t;}
        void  setNext(Event *E) { next=E;}
        void*   operator new(size_t);   /* new operator of class Event  */
        void    operator delete( void*, /* delete operator of class     */
                                 size_t);/* Event                       */
        friend ostream& operator<<( ostream&,   /* print the content    */
                                    Event&);    /*  of the event node   */
        ~Event() { delete next;}            
           /*        destructor                   */ 
};
                
#endif

