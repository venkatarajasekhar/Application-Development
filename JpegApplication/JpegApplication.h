#ifndef JPEGAPPLICATION_H
#define JPEGAPPLICATION_H

#include <iostream>
using namespace std;

/* Place holder for thread synchronization mutex */
class Mutex
{   /* placeholder for code to create, use, and free a mutex */
};
 
/* Place holder for thread synchronization lock */
class Lock
{   public:
        Lock(Mutex& m) : mutex(m) { /* placeholder code to acquire the mutex */ }
        ~Lock() { /* placeholder code to release the mutex */ }
    private:
        Mutex& mutex;
};

/*
#include <iostream>
using namespace std;
class Singleton
{   public:
        static Singleton* GetInstance();
        int a;
        ~Singleton() { cout << "In Destructor" << endl; }
 
    private:
        Singleton(int _a) : a(_a) { cout << "In Constructor" << endl; }
        
 
        // Not defined, to prevent copying
        Singleton(const Singleton& );
        Singleton& operator =(const Singleton& other);
};
 
Mutex Singleton::mutex;
 
Singleton* Singleton::GetInstance()
{
    Lock lock(mutex);
 
    cout << "Get Instance" << endl;
 
    // Initialized during first access
    static Singleton inst(1);
 
    return &inst;
}
 
int main()
{
    Singleton* singleton = Singleton::GetInstance();
    cout << "The value of the singleton: " << singleton->a << endl;
    return 0;
}
*/
/*
Singleton design pattern used to develop the application,
Assume that Application executes C++11 Compiler
Private :Ctor,CopyCtor,Assignment operator won't allow the Copies
*/
class JpegApplication
{
    public:
	  static JpegApplication* GetInstance();
	  bool JpegFileParser(void);  
      virtual ~JpegApplication();
	  //Static Mutex Object
	  int data;
      static Mutex mutex;
    protected:
    private:
	  //Member Function
	  JpegApplication(int); //Ctor 
      JpegApplication(const JpegApplication& ) = delete; //Copy Ctor
      JpegApplication& operator=(const JpegApplication&)=delete; //Operator OverLoading
	  
};

#endif // JPEGAPPLICATION_H
