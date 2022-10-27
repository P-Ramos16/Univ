//
// Tomás Oliveira e Silva, AED, October 2021
//
// example of a generic function (with a template)
//

#include <iostream>
#include <iomanip>

using namespace std;

#define size(x)  (int)(sizeof(x) / sizeof(x[0]))

template <typename T>
T sum(const T *a,int n)
{
  T s = T(0);
  for(int i = 0;i < n;i++)
    s += a[i];
  return s;
}


template <typename T>
T mean(const T *a,int n)
{
  T s = T(0);
  for(int i = 0;i < n;i++)
    s += a[i];
  return (double) (s / n);
}


int main(void)
{
  int ia[] = { 1,2,3,4,5 };
  double da[] = { 1.0,3.0,5.0 };

  cout << "ia[] sum: "
       << std::setw(6)
       << sum<int>(ia,size(ia))
       << endl
       << "da[] sum: "
       << std::fixed << std::setw(8) << std::setprecision(2)
       << sum<double>(da,size(da))
       << "\n"
       << "ia[] mean: "
       << std::setw(4)
       << mean<int>(ia,size(ia))
       << endl
       << "da[] mean: "
       << std::fixed << std::setw(7) << std::setprecision(2)
       << mean<double>(da,size(da))

       << endl;
  return 0;
}