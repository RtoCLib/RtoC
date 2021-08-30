# crear un archivo y repetir el procedimiento 50 veces para calcular el promedio
cat(file="resultado.csv", "apply\tfor\t\n") # Archivo donde se guardaran los resultados 
largo = 12 # Total de repeticiones y largo de 2^1 hasta 2^largo
lista_prom <- vector("list",length=largo) # lista donde se guardará el promedio de las repeticiones
rep = 15 # repeticiones que se haran
for (k in 1:largo){ # rellenar el arreglo de una tuplas de (0,0)
    lista_prom[k] <- list(c(0,0)) # tupa 
}

for (k in 1:rep){ # repeticiones
    iterador = 1
    for (j in 1:largo) { # calculo de tiempos 
        n <- 2^(j+1) # largo de la matriz 
        m <- 2^(j) # ancho de la matriz 
        A <- matrix(nrow=n, ncol=m, data=rnorm(n * m)) # crearción de la matriz
        write.table(x = A, file = "datos.csv", row.names=FALSE, col.names=FALSE) # escribiendo la matriz de un archivo
        matriz1 = read.table("datos.csv",header=FALSE) # guardamos la matriz

        stime <- Sys.time() # se capruta el tiempo donde inicia 										
        apply(matriz1, FUN=sum, MARGIN=2) # Sumamos matrices por columnas con apply		
        etime <- Sys.time()	# se capruta el tiempo donde termina
        time1 = etime - stime # se calcula el tiempo 
        cat(file="resultado.csv", etime - stime, "\t", append=TRUE)	# Guardamos el tiempo de apply


        stime <- Sys.time()	# se capruta el tiempo donde inicia 
        for(i in i:dim(matriz1)[2]){ # iteramos con for
            sum(matriz1[,i]) # suma matrices por columnas
        }
        etime <- Sys.time()	# se capruta el tiempo donde termina
        time2 = etime - stime # se captura el tiempo donde termina
        cat(file="resultado.csv", etime - stime, "\n", append=TRUE) # Guardamos el tiempo del for


        resultado1 = lista_prom[[iterador]][1] # extraemos el tiempo del ciclo anterior del apply
        resultado2 = lista_prom[[iterador]][2] # extraemos el tiempo del ciclo anterior del for
        lista_prom[iterador] = list(c( resultado1 + time1, resultado2 + time2)) # se lo suman los tiempos
        iterador = iterador + 1 #se agrega para la proxima iteracion
    }

}

cat(file="Promedio.csv","apply\tfor\n") # se crea un archivo donde se guardara el promedio 
for(k in 1:largo){ # se recorre la lista
    resultado1 = lista_prom[[k]][1] # extraemos el tiempo del ciclo anterior del apply
    resultado2 = lista_prom[[k]][2] # extraemos el tiempo del ciclo anterior del for
    cat(file="Promedio.csv", resultado1/rep,"\t",resultado2/rep, "\n", append=TRUE) #calculamos su promedio
}

