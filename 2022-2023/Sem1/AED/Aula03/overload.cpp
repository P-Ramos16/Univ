//
// Tomás Oliveira e Silva, AED, October 2021
//
// example of function overloading (same function name, different argument numbers and/or data types)
//

#include <iostream>
#include <array>

using std::cout; // make this symbol from the std namespace directly visible


void show(const char c) {
  cout << "char: "
       << c
       << std::endl;
}

void show(const int a[3]) {
  
  cout << "array: [";

  for (int i = 0; i < sizeof(a)/sizeof(*a); i++) {
  cout << a[i] 
       << ",";

  }
  cout << a[sizeof(a)/sizeof(*a)]
       << "]"
       << std::endl;

}




void show(const int i)
{
  cout << "int: "
       << i
       << std::endl;
}

void show(const double d)
{
  cout << "double: "
       << d
       << std::endl;
}

void show(const char *s,const char *h = "string: ") // second argument with default value
{
  cout << h
       << s
       << std::endl;
}

int main(void)
{
  show('a');
  
  int a[3] = { 2,7,-1 };
  show(a);

  show(1.0);
  show("hello");
  show(-3);
  show("John","name: ");
  return 0;
}
