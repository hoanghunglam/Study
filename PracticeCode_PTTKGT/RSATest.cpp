#include<iostream>
#include<stdio.h>
using namespace std;
long int encrypt(int m, long int e, long int n) // Tinh m^e mod n
{
	long int res = m%n;
	for(int i=1;i<e;i++)
	{
		res = (res * m)%n;
	}
	return res;	
}
long int dencrypt(int c, long int d, long int n) // Tinh c^d mod n = m^(ed) mod n 
{
	long int res = c%n;
	for(int i=1;i<d;i++)
	{
		res = (res * c)%n;
	}
	return res;	
}
int main()
{
	long int p=11,q=17;
	long int n=p*q;
	long phi_n=(p-1)*(q-1);
	//Chon e: gcd(n,phi_n) = 1 -- chon e: prime
	long int e=3;
	//Tim d: e*d=1 module phi_n --- thuat toan Euclid mo rong
	long int d=107;
	
	int m=1610;
	cout<<"Ban ro:"<<m<<endl;
	int c= encrypt((int)m,e,n); // Ma hoa ban ro m
	cout<<"Ban ma:"<<c<<endl;
	
	int m1= dencrypt(c,d,n); // m1 -- m: giai ma
	cout<<"Ban gia ma:"<<m1;
}
