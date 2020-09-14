//Do phuc tap O(log(n))
#include<iostream>
using namespace std;

int power(int a,int n)
{
	if(n==0) return 1;
	else if(n%2==0) return power(a*a,n/2);
	else return a*power(a*a,n/2);
}
int main()
{
	cout<<power(4,3);
}
