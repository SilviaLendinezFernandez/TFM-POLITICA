#Obtenemos los datos del fichero csv
datos <- read.table("data/TaxiFlota.csv", sep = ";", header = TRUE )

dim(datos) # Vemos la dimension
head(datos,5) # Mostramos toda la info de los 5 primeros
tail(datos) # Consultamos los últimos datos

datos[datos$Combustible == "DIESEL",] # Nos devuelve todos los taxis cuyo combustible es DIESEL

plot(datos$Combustible , datos$Marca)

head(datos[datos$Número.de.Plazas > 5 & datos$Clasificación.medioambiental == "ECO",],5)

hist(datos$Potencia)

table(table(datos$Matrícula)) # Contamos las frecuencias de Código # Para ver duplicados

# Si queremos cambiar los nombres a las columnas tenemos dos formas de hacerlo:

# O bien una a una 
mi.datos <- datos
colnames(mi.datos)[1] <- "codigo"
colnames(mi.datos)[2] <- "matricula"
colnames(mi.datos)[3] <- "fecha_matriculacion"
colnames(mi.datos)[8] <- "clasificacion_medioambiental"
colnames(mi.datos)[12] <- "numero_plazas"
colnames(mi.datos)[13] <- "fecha_inicio_prestacion"
colnames(mi.datos)[15] <- "regimen_eurotaxi"
colnames(mi.datos)[16] <- "fecha_inicio_eurotaxi"
colnames(mi.datos)[17] <- "fecha_fin_eurotaxi"
colnames(mi.datos)

# O bien buscando los . y las tildes y quitándolas
mi.datos2 <- datos

iconv(colnames(mi.datos2), to="ASCII//TRANSLIT") #Quito las tildes
gsub("\\.", " ", colnames(mi.datos2)) #Quito los puntos y los sustituyo por espacios
colnames(mi.datos2)

#a-zA-ZÀ 
#"[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+"
