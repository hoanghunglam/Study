#include<stdio.h>
int main()
{
	//vd1: int a[]={0,10,-9,43,13,37,17,-19,-5,51};
	//vd2: int a[]={9,19,-4,14,-7,24,-17,15,30,2};
	//vd3: int a[]={17,-11,-10,1,13,27,8,-2,6,30};
	//vd4: int a[]={-1,10,0,33,13,27,-17,-19,11,21};
	//vd5: 
	int a[]={13,-15,2,18,4,8,0,-5,-8,3};	
	int maxS=a[0],maxE=a[0];
	int s=0,e=0,s1=0;
	int i;
	for(i=1;i<10;i++)
	{
		if(maxE>0)
		{
			maxE=maxE+a[i];
		}
		else
		{
			maxE=a[i];
			s1=i;
		}
		if(maxE>maxS)
		{
			maxS=maxE;
			e=i;
			s=s1;
		}
	}
	printf("%d\n",maxS);
	printf("%d-%d",s,e);
	return 0;
}
