#include <iostream>
#include <stdio.h>
#include "../writer/frg_writer.h"
#include "../reader/frg_reader.h"

void JpegLoadTime::JpegLoadTime(){
	
	
	
}

void JpegLoadTime::readFile(std::vector<unsigned char>& dstData,const char* srcFileName){
    try{
	FILE	* file = fopen(srcFileName, "rb");
	}catch(){
		
	}catch(...){
		
	}
	try{
	fseek(file,0,SEEK_END);
	}catch(){
		
	}catch(...){
		
	}
	int file_length = (int)ftell(file);
	try{
	fseek(file,0,SEEK_SET);
	}catch(){
		
	}catch(...){
		
	}
    dstData.resize(file_length);
    if (file_length > 0)
        fread(&dstData[0],1,file_length,file);
    try{
    fclose(file);
	}catch(){
		
	}catch(...){
		
	}
}

void JpegLoadTime::writeFile(const std::vector<unsigned char>& srcData,const char* dstFileName){
    try{
	FILE	* file=fopen(dstFileName, "wb");
    }catch(){
	}catch(...){
		
	}
    int dataSize=(int)srcData.size();
    if (dataSize > 0)
    try{    
	fwrite(&srcData[0], 1,dataSize, file);
    }catch(){
		
	} catch(...){
		
	}
	try{
    fclose(file);
	}catch(){
		
	}catch(...){
		
	}
}

void JpegLoadTime::loadBmpImage(frg::TFrgPixels32Ref& image){
    const int width=800;
    const int height=600;
	try{
    image.pColor=new frg::TFrgBGRA32[width*height];
	}catch(){
		
	}catch(...){
		
	}
	
    image.width=width;
    image.height=height;
    image.byte_width=width*sizeof(frg::TFrgBGRA32);

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
	 frg::TFrgParameter frg_encode_parameter(80,50);
	 }catch(){
		 
	 }catch(...){
		 
	 }
    //frg::TFrgParameter frg_encode_parameter(100,0); //lossless and minsize
    try{
	writeFrgImage(out_frgImageCode, bmpImage, frg_encode_parameter);
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
    unsigned char *tempMemory=new unsigned char[frgInfo.decoder_tempMemoryByteSize];
    }catch(){
		
	}catch(...){
		
	}
    bmpImage.byte_width=frgInfo.imageWidth*kFrg_outColor_size;
    try{
	bmpImage.pColor=new unsigned char[frgInfo.imageWidth*bmpImage.byte_width];
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