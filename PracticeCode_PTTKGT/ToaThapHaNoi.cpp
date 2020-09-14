#include <stdio.h>
void DICH_CHUYEN(int n, int c1, int c2,int c3)
{
	if(n==1) printf("\n\t%d ->%d",c1,c2);
	else
	{
		DICH_CHUYEN(n-1,c1,c3,c2);
	    DICH_CHUYEN(1,c1,c2,c3);
	    DICH_CHUYEN(n-1,c3,c2,c1);
	}
}
 
int main()
{
   int n,c1=1,c2=2,c3=3;
   printf("\ncho so dia can chuyen:");scanf("%d",&n);
   DICH_CHUYEN(n,c1,c2,c3);
   return 0;
}

