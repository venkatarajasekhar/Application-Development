#include "Application.h"
#include <iostream>

using namespace std;

int main(){
	
	JpegApplication* JpegApplication = JpegApplication::GetInstance();
    cout << "The value of the JpegApplication: " << JpegApplication->data << endl;
    return 0;

/* Hard Coding the Path
Functional Test Case:
Read only display of the PPT:Jpeg
*/







/* Non Functional Test Case:
Invalid File Format
Invalid Directory Path
Invalid Path Name

*/







}
