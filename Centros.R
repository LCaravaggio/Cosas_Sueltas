rm(list=ls())

#Librerias
library(readr)
library(dyn)

#Cargar el CSV
indec <- read.csv("C:/data/bsas.csv")
trends<- read.csv("C:/data/bsasT.csv")

a <- zoo(indec[,-1],as.Date(indec[,1]))
b <- zoo(trends[,-1],as.Date(trends[,1]))

y <- a$J
x <- b[,c(6,7)]

# baseline model
reg0 <- dyn$lm(y~lag(y,-1)+lag(y,-12))
summary(reg0)

# trends model
reg1 <- dyn$lm(y~lag(y,-1)+lag(y,-12)+b$J)
summary(reg1)


# out of sample forecast
source("c:/data/oosf.R")
z <- OutOfSampleForecast12(y,x,17)
summary(z)
# overall fit
MaeReport(z)




