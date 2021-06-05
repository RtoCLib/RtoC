#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//N y M dimenciones de la Matriz
int n = 2;
int m = 2;
void generarMatrizFOR(int Nmax, int **Matriz) {
  int i, j;
  Matriz = (int **)malloc(n * sizeof(int*)); 
  for (i = 0; i < n; i++) {
    Matriz[i] = (int *)malloc(m * sizeof(int));
    for (j = 0; j < m; j++) {
      Matriz[i][j] = rand() % (Nmax + 1);
    }
  }
}

void sumaColumnasFOR(int **Matriz,  int *Vector) {
  int i, j;
  Vector = (int *)malloc(m * sizeof(int)); 
  for (i = 0; i < m; i++) {
    Vector[i] = 0;
    for (j = 0; j < n; j++) {
      Vector[i] += Matriz[j][i]; // se cae aca por alguna razon
    }
  }
}
void liberar(int **M){
  int i;
  for (i = 0; i < n; i++) {
    free(M[i]);
  }
  free(M);
}


time_t funcionFOR(f, c){
  time_t inicio, fin, S;
  int **M = NULL;
  int *V = NULL;  

  n = f;
  m = c;

  generarMatrizFOR(10, M);

  time(&inicio);
  sumaColumnasFOR(M,V);
  time(&fin);

  S = fin - inicio;
  printf("%ld\n", S);
  liberar(M);
  return S;
}

int main(){
  funcionFOR(2,1);
  printf("%d, %d", n, m);

  return 0;
}