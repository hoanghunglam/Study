#include<stdio.h>
int Mu(int x,int n)
{
	if(n==0)
	{
		return 1;
	}
	else
	{
		return x*Mu(x,n-1);
	} 
}
int main()
{
	printf("%d",Mu(4,3));
	return 0;
}

