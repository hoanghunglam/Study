#include<stdio.h>
int GiaiThua(int n)
{
	if(n==0 || n==1) return 1;
	else return n*GiaiThua(n-1);
}

int main()
{
	printf("%d",GiaiThua(4));
	return 0;
}
