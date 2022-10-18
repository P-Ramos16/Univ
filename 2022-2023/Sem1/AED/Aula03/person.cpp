//
// Tomás Oliveira e Silva, AED, October 2021
//
// example of a class
//

#include <math.h>
#include <iostream>

using namespace std;

class person
{
  private:
    const static int max_size = 99;
    const static int debug = 1;
    char d_name[max_size + 1];
    char d_address[max_size + 1];
    int d_number;
  public:
    person(const char *name = "",const char *address = "", const int number = 0); // constructor
    ~person(void);                                          // destructor
    
    void set_name(const char *name);
    void set_address(const char *address);
    void set_number(const int number);
    
    const char *get_name(void);
    const char *get_address(void);
    const int get_number(void);
};

void person::set_name(const char *name)
{
  int i;

  //
  // in C and C++, strings are arrays of characters, terminated with a 0 (i.e., '\0')
  // so, to copy a string, we need to do it one char at a time
  // '\0' has the value 0, but is of type char
  // the input name is silently truncated if it is too large (this may cause trouble
  //   if utf-8 is used to encode the string characters)
  //
  for(i = 0;name[i] != '\0' && i < max_size;i++)
    d_name[i] = name[i];
  d_name[i] = '\0'; // always terminate the string properly
}

void person::set_address(const char *address)
{
  int i;

  for(i = 0;address[i] != '\0' && i < max_size;i++)
    d_address[i] = address[i];
  d_address[i] = '\0';
}

void person::set_number(const int number)
{
  d_number = number;
}


person::person(const char *name,const char *address, const int number)
{ // constructor
  if(debug != 0)
    cout << "person constructor called" << endl;
  this->set_name(name);
  this->set_address(address);
  this->set_number(number);
}

person::~person(void)
{ // destructor
  if(debug != 0)
    cout << "person destructor called" << endl;
}

inline const char *person::get_name(void)
{
  return d_name;
}

inline const char *person::get_address(void)
{
  return d_address;
}


inline const int person::get_number(void)
{
  return d_number;
}


std::ostream & operator << (std::ostream &os,person &p)
{ // make the << operator also work with the person data type
  return os << "[Name]: "
            << p.get_name()
            << "  [Address]: "
            << p.get_address()
            << "  [Number]: "
	    << p.get_number()
	    << endl;
}

int main(void)
{
  person p = person("John Doe","no address", 919702780); // create a new object and then copy it to p
  person q("no name","no address", 0);           // create a new object (no copy needed)

  cout << "Before change of address: " << p.get_name() << ", " << p.get_address() << endl;
  p.set_address("bench 24, Central Park, New York");
  cout << "After change of address:  " << p.get_name() << ", " << p.get_address() << endl;

  cout << q; // use the << operator (q is a person!)
  return 0;
}
