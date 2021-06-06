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
      Vector[i] += Matriz[j][i];
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
      Vector[i] += Matriz[j][i];
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


double funcionFOR(f, c){
  clock_t inicio, fin, S;
  float **M = NULL;
  float *V = NULL;  

  n = f;
  m = c;

  M = generarMatriz(10000, M);

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
  float **M = NULL;
  float *V = NULL;  

  n = f;
  m = c;

  M = generarMatriz(10000, M);

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


/*

Promedio (for) iteracion   1: 0.000001
Promedio (while) iteracion 1: 0.000001

Promedio (for) iteracion   2: 0.000002
Promedio (while) iteracion 2: 0.000001

Promedio (for) iteracion   3: 0.000002
Promedio (while) iteracion 3: 0.000002

Promedio (for) iteracion   4: 0.000004
Promedio (while) iteracion 4: 0.000002

Promedio (for) iteracion   5: 0.000022
Promedio (while) iteracion 5: 0.000003

Promedio (for) iteracion   6: 0.000039
Promedio (while) iteracion 6: 0.000006

Promedio (for) iteracion   7: 0.000347
Promedio (while) iteracion 7: 0.000012

Promedio (for) iteracion   8: 0.001517
Promedio (while) iteracion 8: 0.000028

Promedio (for) iteracion   9: 0.008448
Promedio (while) iteracion 9: 0.000082

Promedio (for) iteracion   10: 0.023046
Promedio (while) iteracion 10: 0.000138

Promedio (for) iteracion   11: 0.205554
Promedio (while) iteracion 11: 0.000255

Promedio (for) iteracion   12: 1.159142
Promedio (while) iteracion 12: 0.000528

*/
