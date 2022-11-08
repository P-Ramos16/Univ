//
// Tomás Oliveira e Silva, AED, November 2021
//
// matched-parenthesis verification
//

#include <iostream>
#include "aStack.h"
#include<string.h>

using std::cout;
using std::cerr;
using std::endl;

int check_parenthesis(const char *s) {

  int returnCode = 0;  
  aStack<int> stack;  
  for(int i = 0; i < strlen(s); i++) {
    if (s[i] == '(') {
      stack.push(i);
    }
    else if (s[i] == ')') {
      if (stack.is_empty()) {
        returnCode = 1;
        cout << "  unmatched \')\' at position " << i << endl;
      }
      else {
        cout << "  \'(\' at position " << stack.top() << " and matching \')\' at position " << i << endl;
        stack.pop();
      }
    }
  }
  while(!stack.is_empty()) {
      returnCode = 1;
      cout << "  unmatched \'(\' at position " << stack.top() << endl;
      stack.pop();
  }
  return returnCode;

}

int main(int argc,char **argv)
{
  if(argc == 1)
  {
    cerr << "usage: " << argv[0] << " [arguments...]" << endl;
    cerr << "example: " << argv[0] << " 'abc(def)ghi' 'x)(y'" << endl;
    return 1;
  }
  for(int i = 1;i < argc;i++)
  {
    cout << argv[i] << endl;
    if(check_parenthesis(argv[i]) == 0)
      cout << "  good" << endl;
    else
      cout << "  bad" << endl;
  }
  return 0;
}
