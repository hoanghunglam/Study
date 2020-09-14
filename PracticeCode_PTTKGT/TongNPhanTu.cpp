#include<stdio.h>
int Tong(int a[],int n)
{
	if(n==1) return a[0];
	else return a[n-1]+Tong(a,n-1);
}
int main()
{
	int a[]={1,2,3,4,5};
	printf("%d",Tong(a,4));
	return 0;
}
