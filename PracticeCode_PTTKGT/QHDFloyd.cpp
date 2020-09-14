#include<stdio.h>
#define vc 10000
void floyd(int a[4][4],int n)
{
	int d[n][n],p[n][n];
	int i,j,k;
	for(i=1;i<=n;i++)
	{
		for(j=1;j<=n;j++)
		{
			d[i][j]=a[i][j];
			p[i][j]=0;
		}
	}
	for(k=1;i<=n;k++)
	{
		for(i=1;i<=n;i++)
		{
			if(d[i][k]>0 && d[i][k]<vc)
			{
				for(j=1;j<=n;j++)
				{
					if(d[k][j]>0 && d[k][j]<vc)
					{
						if(d[i][k]+d[k][j]<d[i][j])
						{
							d[i][j]=d[i][k]+d[k][j];
							p[i][j]=k;
						}
					}
				}
			}
		}
	}
	printf("Duong di tu 1->3: ");
	for(i=1;i<=n;i++)
	{
		printf("%d",p[3][i]);
	}
}
int main()
{
	int a[4][4]={(0,5,vc,vc),(50,0,15,5),(30,vc,0,15),(15,vc,5,0)};
	for(int i=1;i<=4;i++)
	{
		for(int j=1;j<=4;j++)
		{
			printf("%d",a[i][j]);
		}
	}
	//floyd(a,4);
	return 0;
}
