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
  int i, j, iter_j = 15, k = 12;
  double PromedioFOR = 0, PromedioWHILE = 0, A, B;
  FILE *Archivo, *Archivo2;
  Archivo = fopen("Promedios_C.csv", "w+");
  Archivo2 = fopen("Datos_C.csv", "w+");
  fprintf(Archivo, "%s,", "k");
  fprintf(Archivo2, "%s,", "k");
  for (j = 0; j < iter_j; j++)
    fprintf(Archivo, "For_%d,While_%d,", j, j);

  fprintf(Archivo, "\n");
  fprintf(Archivo2, "%s,%s\n", "P_For", "P_While");
  for (i = 1; i <= k; i++)
  {
    fprintf(Archivo, "%d,", i);
    fprintf(Archivo2, "%d,", i);
    for (j = 0; j < iter_j; j++)
    {
      A = funcionFOR(pow(2,i),pow(2,i+1));
      B = funcionWHILE(pow(2,i),pow(2,i+1));
      fprintf(Archivo, "%lf,%lf,", A,  B);
      PromedioFOR = PromedioFOR + A;
      PromedioWHILE = PromedioWHILE + B;
    }
    PromedioFOR /= iter_j;
    PromedioWHILE /= iter_j;
    fprintf(Archivo2, "%lf,%lf\n",PromedioFOR,PromedioWHILE);
    fprintf(Archivo, "\n");
    PromedioFOR = 0;
    PromedioWHILE = 0;
  }
  puts("Completado");
  fclose(Archivo);
  fclose(Archivo2);
  return 0;
}

