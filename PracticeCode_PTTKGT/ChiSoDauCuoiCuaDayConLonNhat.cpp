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
	int a[]={-98,54,67, 65,-879,78,65,21,-6,67};
	int sum=0;
	int maxSum = maxSubVector(a,0,9);
	cout<<maxSum<<endl;
	/*
	for(int i=0;i<=8;i++)
	{
		sum=a[i];
		for(int j=i+1;j<=9;j++)
		{
			sum+=a[j];
			if(sum==maxSum)
			{
				cout<<"Chi so dau "<<i<<endl;
				cout<<"Chi so cuoi "<<j<<endl;
			}
		}
	}
	*/
}
