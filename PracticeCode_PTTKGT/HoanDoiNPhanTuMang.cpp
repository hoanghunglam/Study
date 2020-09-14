#include<stdio.h>

void DoiCho(int a[],int i,int j,int m)
{
	
}

int HoanDoiPTM(int a[],int n,int m)
{
	int i=m;
	int j=n-m;
	m=m+1;
	if(i!=j)
	{
		if(i>j)
		{
			DoiCho(a,m-i,m,j);
			i=i-j;
		}
		else
		{
			j=j-i;
			DoiCho(a,m-i,m+j,i);
		}
	}
	else
	{
		DoiCho(a,m-i,m,i);		
	}
	return a;
}
int main()
{
	int a[]={3,5,8,9,4,2,7,5,3,9,8};
	printf("%d",HoanDoiPTM(a,11,3));
	return 0;
}
