#include<iostream>
using namespace std;

struct CongViec
{
	int start;
	int end;
};

int main()
{
	CongViec cv[100],tg;
	int n,i,j;
	cout<<"Nhap so cong viec: ";
	cin>>n;
	cout<<"Nhap thoi gian: "<<endl;
	for(i=0;i<n;i++)
	{
		cin>>cv[i].start;
		cin>>cv[i].end;
	}
	//sap xep
	for(i=0;i<n;i++)
	{
		for(int j=i+1;j<n;j++)
		{
			if(cv[i].start>cv[j].start)
			{
				tg=cv[i];
				cv[i]=cv[j];
				cv[j]=tg;
			}
		}
	}
	cout<<"Danh sach cong viec duoc chon: "<<endl;
	cout<<cv[0].start<<" "<<cv[0].end<<endl;
	int d=0;
	for(i=1;i<n;i++)
	{
		if(cv[i].start>cv[d].end)
		{
			cout<<cv[i].start<<" "<<cv[i].end<<endl;
			d=i;
		}
	}
	return 0;
}
