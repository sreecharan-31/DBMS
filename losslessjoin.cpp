#include <bits/stdc++.h>

using namespace std;
class llj
{
  string s[10];
  int n;
  string r;
public:
  void read();
  void test();
};

int main()
{
  llj obj;
  obj.read();
  obj.test();
}

void llj::test()
{
  string res;
  res=s[0];
  for(int i=0;i<n-1;i++)
  {
      string temp,diff;
      set_intersection(res.begin(),res.end(),s[i+1].begin(),s[i+1].end(),back_inserter(temp));
      //cout<<temp<<endl;
      if(temp.length()>0)
      {
          set_difference(s[i+1].begin(),s[i+1].end(),res.begin(),res.end(),back_inserter(diff));
          //cout<<diff<<endl;
          res.append(diff);
      }
  }
  if(res==r)
  {
    cout<<"Lossless Join"<<endl;
  }
  else
  {
    cout<<"Lossy Join"<<endl;
  }
}

void llj::read()
{
  cout<<"Enter the Number of Relations: "<<endl;
  cin>>n;
  for(int i=0;i<n;i++)
  {
    cin>>s[i];
    sort(s[i].begin(),s[i].end());
  }
  cout<<"Enter the complete relation before decomposition: "<<endl;
  cin>>r;
}
