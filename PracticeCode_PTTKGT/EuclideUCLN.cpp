#include<stdio.h>
#include<conio.h>
int EuclideUCLN(int a,int b)
{
	if(a==b) return a;
	else 
	{
		if(a>b) return EuclideUCLN(a-b,b);
		else return EuclideUCLN(a,b-a);
	}
}
main()
{
	printf("%d\n", EuclideUCLN (10,15));
	getch();
}

