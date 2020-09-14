#include<iostream>
using namespace std;
void DoiCho(int &a, int &b)
{
	int tmp=a;
	a=b;
	b= tmp;
}
void ThamLam1(int c[], int w[], int n, int b)
{
	int i,j;
	for(i=0;i<n-1;i++)
	{
		for(j=i+1;j<n;j++)
		{
			if(c[i]<c[j])
			{
				DoiCho(c[i],c[j]);
				DoiCho(w[i],w[j]);
			}
		}
	}
	for(i=0;i<n;i++)
	{
		if(b>w[i])
		{
			cout<<"Chon do vat co khoi luong = "<<w[i]<<" gia tri bang "<<c[i]<<endl;
			b=b-w[i];
		}
	}
}
void ThamLam2(int c[], int w[], int n, int b)
{
	int i,j;
	for(i=0;i<n-1;i++)
	{
		for(j=i+1;j<n;j++)
		{
			if(w[i]>w[j])
			{
				DoiCho(c[i],c[j]);
				DoiCho(w[i],w[j]);
			}
		}
	}
	for(i=0;i<n;i++)
	{
		if(b>w[i])
		{
			cout<<"Chon do vat co khoi luong = "<<w[i]<<" gia tri bang "<<c[i]<<endl;
			b=b-w[i];
		}
	}
}
void ThamLam3(int c[], int w[], int n, int b)
{
	int i,j;
	for(i=0;i<n-1;i++)
	{
		for(j=i+1;j<n;j++)
		{
			if(1.0*(c[i]/w[i])<1.0*(c[j]/w[j]))
			{
				DoiCho(c[i],c[j]);
				DoiCho(w[i],w[j]);
			}
		}
	}
	for(i=0;i<n;i++)
	{
		if(b>w[i])
		{
			cout<<"Chon do vat co khoi luong = "<<w[i]<<" gia tri bang "<<c[i]<<endl;
			b=b-w[i];
		}
	}
}
int main()
{
	int b=19;
	int w[3]={14,6,10};
	int c[3]={20,16,8};
	ThamLam1(c,w,3,b);
	ThamLam2(c,w,3,b);
	ThamLam3(c,w,3,b);
	return 0;	
}
