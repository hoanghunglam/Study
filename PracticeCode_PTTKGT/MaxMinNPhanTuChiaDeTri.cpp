#include<stdio.h>
int Max(int a[],int s,int e)
{
	if(s==e) return a[s];
	else  
	{
		int ML= Max(a,s,(s+e)/2);
		int MR = Max(a,(s+e)/2 + 1,e);
		if(ML>MR)
		return ML;
		else return MR;
	}
}
int Min(int a[],int s,int e)
{
	if(s==e) return a[s];
	else  
	{
		int ML= Min(a,s,(s+e)/2);
		int MR = Min(a,(s+e)/2 + 1,e);
		if(ML>MR)
		return MR;
		else return ML;
	}
}

int main()
{
	int a[]={3,5,8,9,4,2,7,5,3,9,8};
	printf("Max=%d Min=%d",Max(a,0,10),Min(a,0,10));
	return 0;
}

