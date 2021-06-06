#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

//N y M dimenciones de la Matriz
int n = 2;
int m = 2;
int** generarMatriz(int Nmax, int **Matriz) {
  int i, j;
  Matriz = (int **)malloc(n * sizeof(int*)); 
  for (i = 0; i < n; i++) {
    Matriz[i] = (int *)malloc(m * sizeof(int));
    for (j = 0; j < m; j++) {
      Matriz[i][j] = rand() % (Nmax + 1);
    }
  }
  return Matriz;
}

int* sumaColumnasFOR(int **Matriz,  int *Vector) {
  int i, j;
  Vector = (int *)malloc(m * sizeof(int)); 
  for (i = 0; i < m; i++) {
    Vector[i] = 0;
    for (j = 0; j < n; j++) {
      Vector[i] += Matriz[j][i];
    }
  }
  return Vector;
}

int* sumaColumnasWHILE(int **Matriz,  int *Vector) {
  int i = 0, j = 0;
  Vector = (int *)malloc(m * sizeof(int)); 
  while (i < m) {
    Vector[i] = 0;
    while (j < n) {
      Vector[i] += Matriz[j][i];
      j++;
    }
    i++;
  }
  return Vector;
}
void liberar(int **Matriz){
  int i;
  for (i = 0; i < n; i++)
    free(Matriz[i]);
  free(Matriz);
}


double funcionFOR(f, c){
  clock_t inicio, fin, S;
  int **M = NULL;
  int *V = NULL;  

  n = f;
  m = c;

  M = generarMatriz(10, M);

  inicio = clock();
  V = sumaColumnasFOR(M,V);
  fin = clock();

  S = fin - inicio;
  //printf("%f\n", (double) (S )/ CLOCKS_PER_SEC);
  liberar(M);
  return (double) (S )/ CLOCKS_PER_SEC;
}



double funcionWHILE(f, c){
  clock_t inicio, fin, S;
  int **M = NULL;
  int *V = NULL;  

  n = f;
  m = c;

  M = generarMatriz(10, M);

  inicio = clock();
  V = sumaColumnasWHILE(M,V);
  fin = clock();

  S = fin - inicio;
  //printf("%f\n", (double) (S )/ CLOCKS_PER_SEC);
  liberar(M);
  return (double) (S )/ CLOCKS_PER_SEC;
}











int main(){
  int i, j;
  float PromedioFOR = 0, PromedioWHILE = 0;
  for (i = 1; i <= 12; i++)
  {
    for (j = 0; j < 15; j++)
    {
      PromedioFOR += funcionFOR(pow(2,i),pow(2,i+1));
      PromedioFOR /= 2;
      PromedioWHILE += funcionWHILE(pow(2,i),pow(2,i+1));
      PromedioWHILE /= 2;
    }
    printf("Promedio (for) iteracion   %d: %f\n", i,PromedioFOR);
    printf("Promedio (while) iteracion %d: %f\n\n", i,PromedioWHILE);
    PromedioFOR = 0;
    PromedioWHILE = 0;
  }
  return 0;
}
