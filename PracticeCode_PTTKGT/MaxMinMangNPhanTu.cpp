#include<stdio.h>
int Max(int a[],int n)
{
	if(n==1) return a[0];
	else
	{
		int m=Max(a,n-1);
		if(a[n-1]<m) return m;
		else return a[n-1];
	}
}
int Min(int a[],int n)
{
	if(n==1) return a[0];
	else
	{
		int m=Min(a,n-1);
		if(a[n-1]<n) return a[n-1];
		else return m;
	}
}

int main()
{
	int a[]={5,2,1,4,3};
	printf("Max=%d Min=%d",Max(a,4),Min(a,4));
	return 0;
}

