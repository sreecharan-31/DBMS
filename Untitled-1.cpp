#include <iostream>

using namespace std;

int main()
{
  int a,b;
  cin>>a>>b;
  int sum=add(a,b);
  cout<<"Nothing"<<endl;
  return(0);
}

int add(int a, int b)
{
    int sum =a+b;
  return(sum);
}
