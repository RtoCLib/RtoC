###
### Este programa captura tiempo de inversión de matrices mediante tres métodos:
### i) solve
### ii) inv
### iii) ginv
###
### Crea un archivo cuyo csv nombre se almacena en la variable 'fn'.
### Sus columnas contienen:
### i) Orden de una matriz cuadrada
### ii) Tiempo de inversión con función 'solve' (R base)
### ii) Tiempo de inversión con función 'inv' (paquete 'matlib')
### iv) Tiempo de inversión con función 'solve' (paquete 'MASS')
###

fn <- "comparativa_solve_inv_ginv.csv"		# Nombre del archivo csv con tamaños tiempos de ejecución
n <- 1000									# Parámetro para generación de valores aleatorios
k <- c(10, 50, 100, 500, 1000, 5000, 10000)	# Arreglo con tamaños de matrices (cuadradas) a invertir

# Se debe descomentar y ejecutar si no está instalado el paquete respectivo. Se sugiere hacerlo inicialmente una vez con priveilegios de administración. Después no debería ser necesario
#install.packages("matlib", dependencies=TRUE)	# Instala (en el sistema) el paquete 'matlib'
library(matlib)	# Llama al paquete 'matlib'

# Funciona como en el caso anterior. 'MASS' incluye la función 'ginv'
# install.packages("matlib", dependencies=TRUE)	# Instala (en el sistema) el paquete 'MASS'
library(MASS)

cat(file=fn, "n\tsolve\tinv\tginv\n")
for(i in 1:length(k)) {						# Ciclo en los valores: 1, 2, ..., largo de k (definido en en la línea 17)
	cat(file=fn, k[i], "\t", append=TRUE)					# Escribe (en el archivo csv) el orden de la matriz que se invertirá (k[i])
	A <- matrix(nrow=n, ncol=k[i], data=rnorm(n * k[i]))	# Genera matriz A de datos aleatorios normales standard, de orden n*k[i]
	A <- t(A) %*% A											# Calcula matriz cuadrada A = t(A) * A, queda una matriz *invertible* de orden k[i]*k[i]

	# solve
	stime <- Sys.time()										# Captura tiempo inicial
	B <- solve(A)											# B=A^{-1} (mediante 'solve')
	etime <- Sys.time()										# Captura tiempo inicial
	cat(file=fn, etime - stime, "\t", append=TRUE)			# Escribe (en el archivo csv) el orden de la matriz B
	
	# inv
	stime <- Sys.time()										# Captura tiempo inicial
	B <- inv(A)												# B=A^{-1} (mediante 'inv')
	etime <- Sys.time()										# Captura tiempo inicial
	cat(file=fn, etime - stime, "\t", append=TRUE)			# Escribe (en el archivo csv) el orden de la matriz B

	# inv
	stime <- Sys.time()										# Captura tiempo inicial
	B <- ginv(A)											# B=A^{-1} (mediante 'ginv')
	etime <- Sys.time()										# Captura tiempo inicial
	cat(file=fn, etime - stime, "\n", append=TRUE)			# Escribe (en el archivo csv) el orden de la matriz B
}