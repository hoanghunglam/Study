#include<stdio.h>
int F(int n)
{
    if(n==0) return 0;
    else if(n==1) return 1;
    return (F(n-1)+F(n-2));
}
int main()
{
	printf("%d",F(8));
    return 0;
}
