###
title: "R script"
author: "Manuel Pimienta"
date: "27/8/2020"
output: html_document
###

# Cargar librerias
library(dplyr)

# Descargar los datos
#download.file(
#  url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
#  destfile = "Dataset.zip"
#)
#unzip(zipfile = "Dataset.zip", exdir = getwd())


# Configurar directorio de trabajo
directorio_actual <- getwd()

ruta_directorio_datos <- paste(directorio_actual, "/UCI HAR Dataset/", sep = "")
<<<<<<< HEAD
=======


# Se lee el archivo que contiene los nombres de las actividades medidas desde archivo activity_labels.txt
activitylabels <- read.table(file.path(ruta_directorio_datos, "activity_labels.txt"))
View(activitylabels)

>>>>>>> fe16c55cb4e32c460d3466552603ee5c7f02557c

# Leer los archivos descargados en formato txt y crea los marcos de datos
# Carga del primer conjunto test
subject_test <- read.table(file.path(ruta_directorio_datos, "/test/subject_test.txt"))

xtest <- read.table(file.path(ruta_directorio_datos, "/test/X_test.txt"))

ytest <- read.table(file.path(ruta_directorio_datos, "/test/y_test.txt"))

# Carga del primer conjunto train
subject_train <- read.table(file.path(ruta_directorio_datos, "/train/subject_train.txt"))

xtrain <- read.table(file.path(ruta_directorio_datos, "/train/X_train.txt"))

ytrain <- read.table(file.path(ruta_directorio_datos, "/train/y_train.txt"))

# Se lee el archivo que contiene los nombres de las actividades medidas desde archivo activity_labels.txt
activitylabels <- read.table(file.path(ruta_directorio_datos, "/activity_labels.txt"))

colnames(activitylabels) <- c("activityid", "activitylabel")

# Carga de nombres de columnas desde archivo "features"
features <- read.table(file.path(ruta_directorio_datos, "/features.txt"))


# === 1. Merges the training and the test sets to create one data set.
measureactivity <- rbind(
  cbind(subject_test, xtest, ytest),
  cbind(subject_train, xtrain, ytrain)
)

# Cambiar el nombre de las columnas
colnames(measureactivity) <- c("subject", features$V2, "activity")

# === 2. Extracts only the measurements on the mean and standard deviation for each measurement

meanandstandardmeasure <- measureactivity %>% select(contains("subject") | contains("mean") | contains("std") | contains("activity"))
View(meanandstandardmeasure)

# === 3 and 4. Uses descriptive activity names to name the activities in the data set
# Mediante una expreción regular se eliminan los simbolos "-, t, X, Z ()".  
# Appropriately labels the data set with descriptive variable names.
# Tambien se reemplazan las abreviaturas como Acc por aceleración
names <- gsub("[-,(,)]", "", colnames(meanandstandardmeasure),)
names <- gsub("Acc", "Acceleration", names)
names <- gsub("Gyro", "gyroscope", names)
names <- gsub("Mag", "magnitude", names)
names <- gsub("^t", "time", names)
names <- gsub("^f", "frequency", names)
names <- tolower(names)

# Cambiar los nombres de las columnas 
colnames(meanandstandardmeasure) <- names

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averagemeasure <- meanandstandardmeasure %>% 
  group_by(subject, activity) %>%
  summarise_all(mean)

tidydata <- write.table(averagemeasure, "tidydata.txt", sep = ",", row.names = FALSE, col.names = TRUE)
