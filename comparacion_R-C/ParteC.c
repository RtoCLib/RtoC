#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

//N y M dimenciones de la Matriz
int n = 2;
int m = 2;
float** generarMatriz(int Nmax, float **Matriz) {
  int i, j;
  Matriz = (float **)malloc(n * sizeof(float*)); 
  for (i = 0; i < n; i++) {
    Matriz[i] = (float *)malloc(m * sizeof(float));
    for (j = 0; j < m; j++) {
      Matriz[i][j] = rand() % (Nmax + 1);
    }
  }
  return Matriz;
}

float* sumaColumnasFOR(float **Matriz,  float *Vector) {
  int i, j;
  Vector = (float *)malloc(m * sizeof(float)); 
  for (i = 0; i < m; i++) {
    Vector[i] = 0;
    for (j = 0; j < n; j++) {
      Vector[i] = Vector[i] + Matriz[j][i];
    }
  }
  return Vector;
}

float* sumaColumnasWHILE(float **Matriz,  float *Vector) {
  int i = 0, j = 0;
  Vector = (float *)malloc(m * sizeof(float)); 
  while (i < m) {
    Vector[i] = 0;
    while (j < n) {
      Vector[i] = Vector[i] + Matriz[j][i];
      j++;
    }
    i++;
  }
  return Vector;
}
void liberar(float **Matriz){
  int i;
  for (i = 0; i < n; i++)
    free(Matriz[i]);
  free(Matriz);
}


float funcionFOR(int f, int c){
  clock_t inicio, fin, S;
  float **M = NULL;
  float *V = NULL;  

  n = f;
  m = c;

  M = generarMatriz(1000000000, M);

  inicio = clock();
  V = sumaColumnasFOR(M,V);
  fin = clock();

  S = fin - inicio;
  //printf("%f\n", (float) (S )/ CLOCKS_PER_SEC);
  liberar(M);
  return (float) (S )/ CLOCKS_PER_SEC;
}



double funcionWHILE(int f,int c){
  clock_t inicio, fin, S;
  float **M = NULL;
  float *V = NULL;  

  n = f;
  m = c;

  M = generarMatriz(1000000000, M);

  inicio = clock();
  V = sumaColumnasWHILE(M,V);
  fin = clock();

  S = fin - inicio;
  //printf("%f\n", (float) (S )/ CLOCKS_PER_SEC);
  liberar(M);
  return (double) (S )/ CLOCKS_PER_SEC;
}


int main(){
  int i, j, iter_j = 15;
  double PromedioFOR = 0, PromedioWHILE = 0, A, B;
  FILE *Archivo;
  Archivo = fopen("Promedios_C.csv", "w+");
  fprintf(Archivo, "%s,", "k");
  for (j = 0; j < iter_j; j++)
    fprintf(Archivo, "For_%d,While_%d,", i, i);
  
  fprintf(Archivo, "%s,%s", "P_For", "P_While");
  for (i = 1; i <= 12; i++)
  {
    fprintf(Archivo, "%d,", i);
    for (j = 0; j < iter_j; j++)
    {
      A = funcionFOR(pow(2,i),pow(2,i+1));
      B = funcionWHILE(pow(2,i),pow(2,i+1));
      fprintf(Archivo, "%lf,%lf, ", A,  B);
      PromedioFOR = PromedioFOR + A;
      PromedioWHILE = PromedioWHILE + B;
    }
    PromedioFOR /= iter_j;
    PromedioWHILE /= iter_j;
    fprintf(Archivo, "%lf,%lf\n",PromedioFOR,PromedioWHILE);
    PromedioFOR = 0;
    PromedioWHILE = 0;
  }
  puts("Completado");
  return 0;
}

/* 

Promedio (for) iteracion   1: 0.000001
Promedio (while) iteracion 1: 0.000001

Promedio (for) iteracion   2: 0.000002
Promedio (while) iteracion 2: 0.000004

Promedio (for) iteracion   3: 0.000003
Promedio (while) iteracion 3: 0.000002

Promedio (for) iteracion   4: 0.000004
Promedio (while) iteracion 4: 0.000001

Promedio (for) iteracion   5: 0.000014
Promedio (while) iteracion 5: 0.000002

Promedio (for) iteracion   6: 0.000045
Promedio (while) iteracion 6: 0.000006

Promedio (for) iteracion   7: 0.000233
Promedio (while) iteracion 7: 0.000008

Promedio (for) iteracion   8: 0.001081
Promedio (while) iteracion 8: 0.000016

Promedio (for) iteracion   9: 0.005589
Promedio (while) iteracion 9: 0.000054

Promedio (for) iteracion   10: 0.027096
Promedio (while) iteracion 10: 0.000128

Promedio (for) iteracion   11: 0.146320
Promedio (while) iteracion 11: 0.000219

Promedio (for) iteracion   12: 0.942314
Promedio (while) iteracion 12: 0.000471

*/
