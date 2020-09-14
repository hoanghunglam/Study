#include<iostream>
#include<math.h>
using namespace std;

int maxLeftVector(int a[],int i,int j)
{
	int maxSum =-1000;
	int Sum=0;
	for(int k=j;k>=i;k--)
	{
		Sum+=a[k];
		if(Sum>maxSum) maxSum=Sum;
	}
	return maxSum;
}

int maxRightVector(int a[],int i,int j)
{
	int maxSum =-1000;
	int Sum=0;
	for(int k=i;k<=j;k++)
	{
		Sum+=a[k];
		if(Sum>maxSum) maxSum=Sum;
	}
	return maxSum;
}

int maxSubVector(int a[],int i,int j)
{
	int WL,WR,WW;
	int m=(i+j)/2;
	if(i==j) return a[i];
	else
	{
		WL=maxSubVector(a,i,m);
		WR=maxSubVector(a,m+1,j);
		WW=maxLeftVector(a,i,m)+maxRightVector(a,m+1,j);
		return (max(WW,max(WL,WR)));
	}
}

int main()
{
	int a[]={1,-3,2,5,-4,2,3,-9};
	cout<<maxSubVector(a,0,7);
}
