#include<bits/stdc++.h>
using namespace std;

class DBMS
{
	char R[11];
	string f[11][2];
	int n;
	int r;
	string ck[11];
	int b;

public:
	void read();
	void display();
	void fddelete(int i);
	void mincover();
	void checktransitive(string s[2]);
	void delduplicates();
	void closure(int a);
	void candidate();
	DBMS()
	{
		b=0;
	}
};

void DBMS::candidate()
{
	for(int i=1;i<=r;i++)
	{
		closure(i);
	}
	int min=ck[0].length();
	for(int i=0;i<b;i++)
	{
		if(ck[i].length()<min){
			min=ck[i].length();
		}
	}

	int d=0;
	for(int i=0;i<b;i++)
	{
		if(ck[i].length()==min)
		{
			ck[d]=ck[i];
			d++;
		}
	}
	b=d;
	for(int i=0;i<b;i++)
	{
		cout<<ck[i]<<endl;
	}
}

void DBMS::read()
{
	cout<<"Enter the Number of realtions: "<<endl;
	cin>>n;
	cout<<"Enter the Number of FD's: "<<endl;
	cin>>r;
	cout<<"Enter the entities in R: "<<endl;
	for(int i=1;i<=n;i++)
	{
		cin>>R[i];
	}
	cout<<"Enter the FD's: "<<endl;
	for(int i=1;i<=r;i++)
	{
		cin>>f[i][0];
		cout<<f[i][0]<<"->";
		cin>>f[i][1];
	}
}

void DBMS::display()
{
	cout<<"R is: "<<endl;
	for(int i=1;i<=n;i++)
	{
		cout<<R[i]<<",";
	}
	cout<<endl;
	cout<<"The FD's are: "<<endl;
	for(int i=1;i<=r;i++)
	{
		cout<<f[i][0]<<"->"<<f[i][1]<<",";
	}

	cout<<endl;
}

void DBMS::fddelete(int i)
{
	for(int j=i;j<r;j++)
	{
		f[j][0]=f[j+1][0];
		f[j][1]=f[j+1][1];
	}
	r--;
}

void DBMS::mincover()
{
	for(int i=1;i<=r;i++)
	{
		if(f[i][1].length()>1)
		{
			for(int j=2;j<=f[i][1].length();j++)
			{
				r++;
				f[r][0]=f[i][0];
				f[r][1]=f[i][1][j-1];
			}
		}
		f[i][1]=f[i][1][0];
	}
	//delduplicates();

	for(int i=1;i<=r;i++)
	{
		if(f[i][0].length()>1)
		{

			{
				for(int k=1;k<=n;k++)
				{
					sort(f[k][0].begin(),f[k][0].end());
					sort(f[k][1].begin(),f[k][1].end());
					sort(f[i][0].begin(),f[i][0].end());
					string temp;
					set_union(f[k][0].begin(),f[k][0].end(),f[k][1].begin(),f[k][1].end(),back_inserter(temp));
					int flag=0;
					int c=0;
					for(int j=0;j<f[i][0].length();j++)
					{
						if(c!=temp.length()-1)
						{
							if(f[i][0][j]==temp[c])
							{
								c++;
							}

							else
							c=0;
						}
						else
							flag=1;
					}
					if(flag==1)
					{
						string res;
						set_difference(f[i][0].begin(),f[i][0].end(),f[k][1].begin(),f[k][1].end(),back_inserter(res));
						f[i][0]=res;
					}
				}
			}
		}
	}
	delduplicates();



	for(int i=1;i<=r;i++)
	{
		int a[n];
		int c=0;
		for(int j=1;j<=r;j++)
		{
			if(f[i][0]==f[j][0])
			{
				a[c]=j;
				c++;
			}
		}

		for(int j=0;j<c;j++)
		{
			string temp[2];
			set_union(f[i][1].begin(),f[i][1].end(),f[j][1].begin(),f[j][1].end(),back_inserter(temp[1]));
			temp[0]=f[i][0];
			checktransitive(temp);
		}
	}
	delduplicates();
}

void DBMS::checktransitive(string s[2])
{
	for(int j=1;j<=r;j++)
	{
		if(s[1]==f[j][0])
		{
			for(int k=1;k<=r;k++)
			{
				if(s[0]==f[k][0] && f[j][1]==f[k][1])
					fddelete(k);
			}
		}
	}
}

void DBMS::closure(int a)
{
	string str;
	for(int i=1;i<=n;i++)
	{
		str[i-1]=R[i];
	}
	cout<<str<<endl;
	string temp;
	temp=f[a][0];
	temp.append(f[a][1]);
	for(int i=1;i<=n;i++)
	{
		string res;
		res=temp;
		for(int k=1;k<=r;k++)
		{
			int flag=0;
			int c=0;
			for(int j=0;j<temp.length();j++)
			{
				if(c!=f[k][0].length()-1)
				{
					if(f[k][0][c]==temp[j])
					{
						c++;
					}

					else
					c=0;
				}
				else
					flag=1;
			}

			if(flag==1)
			{
				set_union(temp.begin(),temp.end(),f[k][1].begin(),f[k][1].end(),back_inserter(res));
			}
		}
		if(temp==res)
		{
			break;
		}

		else
			temp=res;
	}

	if(temp==str)
	{
			ck[b]=f[a][0];
			b++;
	}
}

void DBMS::delduplicates()
{
	int a[n];
	int c=0;
	for(int i=1;i<=r;i++)
	{
		for(int j=1;j<=r && j!=i;j++)
		{
			sort(f[i][0].begin(),f[i][0].end());
			sort(f[i][1].begin(),f[i][1].end());
			sort(f[j][0].begin(),f[j][0].end());
			sort(f[j][1].begin(),f[j][1].end());

			if(f[i][0]==f[j][0] && f[i][1]==f[j][1])
			{
				a[c]=j;
				c++;
			}
		}
	}
	for(int i=0;i<c;i++)
	{
		fddelete(a[i]);
	}
}

int main()
{
	DBMS obj;
	obj.read();
	obj.mincover();
	obj.candidate();
	obj.display();

	return(0);
}
