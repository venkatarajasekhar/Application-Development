#include <iostream>
#include <conio>
#include <string>
#include <fstream>
#include <stdio.h>
#include <vector> 
#include "../writer/frg_writer.h"
#include "../reader/frg_reader.h"

using namespace std;

/* Version 2.0 */

void JpegLoadTime::JpegLoadTime(){
	
	
	
}
void JpegAppstring::operator+(JpegAppstring Jpegobj)
{
    size = size + Jpegobj.size;
    JpegStr = new char[size] runtime_error("Exception: Memory Allocation") ;
	catch(){
		//Logger Implementation
	}
    strcat(JpegStr,Jpegobj.JpegStr);
    cout<<"\nConcatnated JPeg String is: "<<JpegStr;
}

vector<const string&> JpegLoadTime::SplitFilename (const string& strFilePath)
    {
      vector <const string&> FileInfo;
	  size_t FilePathOffset;
      cout << "Splitting: " << strFilePath << endl;
      FilePathOffset = strFilePath.find_last_of("/\\")throw runtime_error("Exception:DirectoryPath");
	 catch(){
		 //Logger Implementation
	 }
     FileInfo[0] = strFilePath.substr(0,FilePathOffset+1)throw runtime_error("Exception:Directory");
	 catch(){
		//Logger Implementation 
	 }
     FileInfo[1] = strFilePath.substr(FilePathOffset+1)throw runtime_error("Exception:FileName");
	 
	 catch(){
		//Logger Implementation 
	 }
	 return FileInfo;
    }

//Sequential Container:Vector,API Read the Jpeg file

void JpegLoadTime::readFile(vector<unsigned char>& dstData,const char* srcFileNamePath){
  
  typedef unsigned char BYTE;
  vector<BYTE> dstDataObj = dstData;
  vector<string> SrcDirectory;
  JpegAppstring JpegObj1,JpegObj2;
    
  try {
	SrcDirectory = SplitFilename(srcFileNamePath);  
    JpegObj1.getstring(SrcDirectory[0]);
	JpegObj2.getstring(SrcDirectory[1];
	//+ operator to Join/Concatenate strings
    JpegObj1+JpegObj2;
	JpegObj1.open ("*.*") throw runtime_error("Could not open the file");
    while (!JpegObj1.eof()){ 
		JpegObj1.get();
	    if (JpegObj1) {
    try{
	JpegObj1.seekg (0, JpegObj1.end)throw runtime_error("Exception:File Offset at the End of File");
	}catch(){
		//Logger Implementation
	}
	int SrcFileSize = JpegObj1.tellg();
    try{
	JpegObj1.seekg (0, JpegObj1.beg)throw runtime_error("Exception:File Offset at the Begin of the File");;
	}catch(){
		//Logger Implementation
	}
	try{
	dstDataObj(SrcFileSize);
    JpegObj1.read((char*)&dstDataObj[0],SrcFileSize) throw runtime_error("Exception:Reading of the File");
	}catch(){
		//Logger Implementation
	}
    try{
	JpegObj1.close() throw runtime_error("Exception:Closing of the File");
	}catch (ifstream::failure e) {
    //Logger Implementation
    }
 catch(...){
		//Logger Implementation
	}

  }
  //Exception handling for the Path of the FileName
  else{
	  
	  
	  
	  
	  
	  
  } 
  
} //End of the While
  }catch(exception &ex){
  cout <<"File Not Found:";
  }catch(...){ //End of the try
  //Logger Implementation 
  }
   return;
}

void JpegLoadTime::loadBmpImage(frg::TFrgPixels32Ref& image){
    const int width=800;
    const int height=600;
	try{
    image.pColor=new frg::TFrgBGRA32[width*height] runtime_error("Exception: Memory Allocation");
	}catch(){
		
	}catch(...){
		
	}
	
    image.width=width;
    image.height=height;
    image.byte_width = width*sizeof(frg::TFrgBGRA32) runtime_error("Exception: Arithmetic Exception");
    frg::TFrgBGRA32* colorLine=image.pColor;
    for (int y=0; y<height; ++y) {
        for (int x=0; x<width; ++x) {
            colorLine[x].a=y-x+127;
            colorLine[x].b=x;
            colorLine[x].g=y;
            colorLine[x].r=x+y;
        }
        colorLine=(frg::TFrgBGRA32*)((unsigned char*)colorLine+image.byte_width); //next line
    }
}

void JpegLoadTime::bmpImage_encodeTo_frgImage(const frg::TFrgPixels32Ref& bmpImage,std::vector<unsigned char>& out_frgImageCode){
     //Ctor Exceptional Handling
	 try{
	 frg::TFrgParameter frg_encode_parameter(80,50) runtime_error("Exception:");
	 }catch(){
		 
	 }catch(...){
		 
	 }
    //frg::TFrgParameter frg_encode_parameter(100,0); //lossless and minsize
    try{
	writeFrgImage(out_frgImageCode, bmpImage, frg_encode_parameter) runtime_error("Exception:");
	}catch(){
		
	}catch(...){
		
	}
}

bool JpegLoadTime::frgImage_decodeTo_bmpImage(const unsigned char* frgCode,const unsigned char* frgCode_end,frg_TPixelsRef& bmpImage){
    //Exception Hanling,Object Creation 
	try{     
	frg_TFrgImageInfo frgInfo;
	}catch(){
		
	}catch(...){
		
	}
    if (!readFrgImageInfo(frgCode, frgCode_end, &frgInfo))
        return false;
	try{
    unsigned char *tempMemory=new unsigned char[frgInfo.decoder_tempMemoryByteSize] runtime_error("Exception");
    }catch(){
		
	}catch(...){
		
	}
    bmpImage.byte_width=frgInfo.imageWidth*kFrg_outColor_size runtime_error("Exception: Arithmetic Exception");
    try{
	bmpImage.pColor=new unsigned char[frgInfo.imageWidth*bmpImage.byte_width] runtime_error("Exception: Memory Allocation");
	}catch(){
		
	}catch(...){
		
	}
    bmpImage.width=frgInfo.imageWidth;
    bmpImage.height=frgInfo.imageHeight;
    bmpImage.colorType=kFrg_ColorType_32bit_A8R8G8B8;
    bool isok;
    if(frg_FALSE != 
	try{
	readFrgImage(frgCode,frgCode_end,&bmpImage,tempMemory,tempMemory+frgInfo.decoder_tempMemoryByteSize,0)){
    }catch(){
		
	}catch(...){
		
	}
	isok =True;
	}
	isok =False;
	try{
    delete []tempMemory;
	}catch(){
		
	}catch(...){
		
	}
    return isok;
}

int main(int argc, const char * argv[]){
    int result=0;
    try{
	frg::TFrgPixels32Ref srcImage;
    }catch(){
		
	}catch(...){
		
	}	
	try{
	JpegLoadTime JpegObj;
	}catch(){
		
	}catch(...){
		
	}
	srcImage.pColor=0;
	try{
	JpegObj.loadBmpImage(srcImage);
	}catch(){
		
	}catch(...){
		
	}	
    std::cout << "argb32 bmp image size:"<<srcImage.width*srcImage.height*4<<"\n";


    //encode
    std::vector<unsigned char> frgImageCode;
	try{
    JpegObj::bmpImage_encodeTo_frgImage(srcImage,frgImageCode);
	}catch(){
		
	}catch(...){
		
	}
	
    std::cout << "frg image size:"<<frgImageCode.size()<<"\n";
    //writeFile(frgImageCode,"frg_demo_temp.frg");
    //Exception Handling
    //decode
    try{
	frg_TPixelsRef dstImage; 
	}catch(){
		
	}catch(...){
		
	}
	dstImage.pColor=0;
    if (!
	    try{
		frgImage_decodeTo_bmpImage(&frgImageCode[0],&frgImageCode[0]+frgImageCode.size(),dstImage)
		}catch(){
			
		}catch(...){
			
		}
		){
        std::cout << "read frg image error!\n";
        result=1;
    }
    try{ 
    delete [](unsigned char*)dstImage.pColor;
	}catch(){
		
	}catch(...){
		
	}
	try{
    delete []srcImage.pColor;
	}catch(){
		
	}catch(...){
		
	}
    std::cout << "\ndone!\n";
    return result;
}