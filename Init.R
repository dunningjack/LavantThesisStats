install.packages("tidyverse")
install.packages("vegan")
install.packages("ggplot2")
install.packages("ggfortify")
install.packages("devtools")
devtools::install_github("gavinsimpson/ggvegan")
install.packages("car")
install.packages("e1071")
install.packages("dplyr")


library("tidyverse")
library("vegan")
library("ggplot2")
library("ggfortify")
library("ggvegan")
library("car")
library("e1071")
library("dplyr")


data<-read.csv("Lavant Data .csv", header = TRUE)
#read in csv file, assign to data

class(data)
#display class of data

summary(data)
#display summary of data

data$Site<-as.factor(data$Site)
data$Site<-factor(data$Site, levels=c("US1", "US2", "DS1", "DS2"), ordered=TRUE)
#convert Site column (character) to factor, set levels of factor
groups<-c("US1", "US2", "DS1", "DS2")

testVars <- c("ASPT", "Temperature", "pH", "DO", "TDS", "Nitrate", "Phosphate", "Faecal.Coliforms", "Escherichia.coli", "Enterococci") #, "Shannon", "Simpson"
for (var in testVars){
  data[[var]] <- as.numeric(data[[var]])
}
#store all columns as numeric

sites <- unique(data$Site)
