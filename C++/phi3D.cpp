#include <iostream>
#include <tclap/CmdLine.h>
#include <stdio.h>  // libreria basica para entrada y salida  
#include <stdlib.h> // libreria para el uso de rand()  
#include <time.h>   // libreria para el uso de time() 
#include <math.h>
#include <itpp/base/random.h>

using namespace std;
using namespace itpp;


TCLAP::CmdLine cmd("Command description message", ' ', "0.1");
TCLAP::ValueArg<double> eps("eps","Parametro_eps", "Parametro de orden",false,1.0,"double",cmd);
TCLAP::ValueArg<double> N("N","Contador_N", "Rompimiento de simetria",false,4.0,"double",cmd);
TCLAP::ValueArg<double> A("A","Coeficiente_A", "Coeficiente de masa A",false,1.0,"double",cmd);
TCLAP::ValueArg<double> NF("NF","Contador_NF", "Numero de iteraciones",false,100,"int",cmd);
TCLAP::ValueArg<double> st("st","Contador_st", "Numero de iteraciones internas",false,200,"int",cmd);

int main(int argc, char* argv[])
{

int Nx = 70;
int Ny = 70;
int Nz = 50;
int R = 11;
int fi[Nx][Ny][Nz];
int r[Nx][Ny][Nz];

	for(int i = 0; i < Nx; i++)
	{
		for(int j = 0; j < Ny; j++)
		{
			for(int k = 0; k < Nz; k++)
			{
				fi[i][j][k]= 1;
				r[i][j][k] = sqrt(pow(i-Nx/2,2) + pow(j-Ny/2,2) + pow(k,2));
				if(r[i][j][k] >= R)
				{
					fi[i][j][k] = -1;
				} 
			}
		}
	}

int bb = min_element(abs(fi[Nx/2][Ny/2][0],fi[Nx/2][Ny/2][Nz-1]));
int R1 = find(fi[Nx/2][Ny/2][0],fi[Nx/2][Ny/2][Nz-1],bb);

			for(int k = 0; k < Nz; k++)
			{
				cout<< fi[Nx/2][Ny/2][k] << endl; 
			}
	
	printf ("\n%d\n",R1);

}
