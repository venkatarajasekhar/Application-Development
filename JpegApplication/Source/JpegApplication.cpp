#include "JpegApplication.h"
#include <iostream>
#include <fstream>
#include <Exception>

using namespace std;
//Init of Static Members of the JpegApplication Class
JpegApplication* JpegApplication::AppInstance = NULL;

JpegApplication::JpegApplication(int JpegVar)
{
//Private Ctor: 
cout << "Private: JpegApplication Constructor \n";
JpegVar = data;
//Application Logic
}
virtual JpegApplication::~JpegApplication()
{
//Public Dtor: 
cout << "Public: JpegApplication Destructor \n";
JpegApplication::AppInstance = NULL
//Application Logic
}

JpegApplication* JpegApplication::GetInstance()
 {
     Lock lock(mutex);
     cout << "Get Instance" << endl;
     static JpegApplication AppInst;
	 return &AppInst;
     
}

bool JpegApplication::JpegFileParser(){
	//Logic to Implement the Validation of the file
	ifstream inpfile; 
	inpfile.exceptions ( ifstream::failbit | ifstream::badbit );
	try{
		inpfile.open("*.jpg");
		while (!inpfile.eof()) 
			inpfile.get();
	  }  //End of Try Block
	catch (ifstream::failure e){
    cout << "Exception opening/reading file";
      }	    
	catch(...){
	cout << "Default Exception:" ;	
	}
    cout << "Reading from the file" << endl; 
    inpfile.close();
    return 0;
	   }
