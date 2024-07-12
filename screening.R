install.packages("tidyverse")
install.packages("vegan")
install.packages("ggplot2")
install.packages("ggfortify")
install.packages("devtools")
devtools::install_github("gavinsimpson/ggvegan")

library("tidyverse")
library("vegan")
library("ggplot2")
library("ggfortify")
library("ggvegan")


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

testVars <- c("BMWP", "ASPT", "Temperature", "pH", "DO", "TDS", "Nitrate", "Phosphate") #, "Shannon", "Simpson"
for (var in testVars){
  data[[var]] <- as.numeric(data[[var]])
}
#store all columns as numeric

sites <- unique(data$Site)



for (var in testVars) {
  print(
    ggplot(data, aes_string(x=var)) + geom_histogram(binwidth=1, fill="blue", color="black") + ggtitle(paste("Histogram of", var)) + xlab(var) + ylab("Frequency")
  )
}
#plot histogram of each variable across all sites

for (var in testVars) {
  # Check if the column is numeric
  if (is.numeric(data[[var]])) {
    # Perform Shapiro-Wilk test
    test_result <- shapiro.test(data[[var]])

    if (test_result$p.value <0.05) {
      cat("\n Shapiro-Wilk Test for Normality for ", var, " at site \n")
      print(test_result)
      print("Reject the null hypothesis, data is not normally distributed")
    } else {
      cat("\n Shapiro-Wilk Test for Normality for ", var,"\n")
      print(test_result)
      print("Fail to reject the null hypothesis, data is normally distributed")
      }
    }
  }
#test normality and variance
#qq plots and boxplots