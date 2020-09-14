#include<stdio.h>
int quickSort(int a[],int l,int r)
{
	int x,i,j;
	if(l>=r) return a[l];
	else
	{
		x=a[l];
		i=l+1;
		j=r;
		while(i<j)
	}
}
int main()
{
	int a[]={3,5,8,9,4,2,7,5,3,9,8};
	printf("%d",quickSort(a,0,10));
	return 0;
}
