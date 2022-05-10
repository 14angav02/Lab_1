#include <fstream>
#include <stdio.h>
#include <stdint.h>

using namespace std;
ofstream fout;
uint32_t srcA=1, srcB=1, result;
int i;
void printBinary (uint32_t val)
{
  for (int i=31; i>=0; i--)
  if (val & (1<<i))
  fout << "1";
  else fout << "0";
}
int main ()
{
fout.open("testvector.tv");
for(i=0;i<31;i++)
   {
       result = srcA + srcB;
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0000";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcA=srcA<<1;
	   srcB=srcB<<1;
   }
srcA=1;
srcB=1;
for(i=0;i<32;i++)
   {
       result = srcA & srcB;
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"1001";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcA=srcA<<1;
	   srcB=srcB<<1;
   }
srcA=1;
srcB=1;
for(i=0;i<32;i++)
   {
       result = ~(srcA | srcB);
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0010";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcA=srcA<<1;
	   srcB=srcB<<1;
   }
srcA=1;
srcB=1;
for(i=0;i<32;i++)
   {
       result = srcA | srcB;
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0001";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcA=srcA<<1;
	   srcB=srcB<<1;
   }
srcA=1;
srcB=1;
for(i=0;i<32;i++)
   {
       result = srcA ^ srcB;
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"1000";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcA=srcA<<1;
	   srcB=srcB<<1;
   }
srcA=2;
srcB=1;
for(i=0;i<31;i++)
   {
       result = srcA - srcB;
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0110";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcA=srcA<<1;
	   srcB=srcB<<1;
   }
srcA=1;
srcB=0;
while(srcB<32)
{
	result = srcA << srcB;
	 printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0100";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcB++;
	   srcA=1;
}
srcA=(1<<31);
srcB=0;
while(srcB<31)
{
	result = srcA >> srcB;
	 printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0011";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcB++;
	   srcA=(1<<31);
}
srcA=2;
srcB=1;
for(i=0;i<30;i++)
   {
       if (srcA<srcB)
	   {
		   result=1;
	   }
	   else
	   {
		   result = 0;
	   }
       printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0101";
       fout<<"_";
       if (srcA<srcB)
	   {
		   fout<<"0";
	   }
	   else
	   {
		   fout<<"1";
	   }
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   if (srcA<srcB)
	   {
		   srcA=srcA<<2;
	   }
	   else
	   {
		    srcB=srcB<<2;
	   }
   }
srcA=(1<<31);
srcB=1;
result = srcA;
while(srcB<31)
{
	result = (result >> 1) | 1<<31;
	 printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0111";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcB++;
}
srcA=(1<<30);
srcB=1;
result = srcA;
while(srcB<31)
{
	result = (result >> 1);
	 printBinary(srcA);
       fout<<"_";
       printBinary(srcB);
       fout<<"_";
       fout<<"0111";
       fout<<"_";
       fout<<"0";
       fout<<"_";
       printBinary(result);
       fout<<endl;
	   srcB++;
}
   fout.close();
   
}
