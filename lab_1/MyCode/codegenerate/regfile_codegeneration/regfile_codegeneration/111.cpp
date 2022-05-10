#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdint.h>
using namespace std;

ofstream fout;
void printBinary (uint32_t val)
{
  for (int i=31; i>=0; i--)
  if (val & (1<<i))
  fout << "1";
  else fout << "0";
}
int main ()
{
	fout.open("reg_file_testvector.tv");
	uint8_t i;
	uint32_t res = 0;
	for(i=0;i<32;i++)
	{
		printBinary (res);
		fout<<endl;
		res = (res + ((i+1)%2))<<1;
	}
}