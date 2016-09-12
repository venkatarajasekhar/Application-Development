#ifndef EXCEPTION_H
#define EXCEPTION_H

#include <iostream>
#include <exception>
using namespace std;

struct AppException : public exception
{
  const char* what () const throw ()
  {
    return "C++ Exception";
  }
};


#endif // EXCEPTION_H
