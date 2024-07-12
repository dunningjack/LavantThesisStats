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

testVars <- c("ASPT", "Temperature", "pH", "DO", "TDS", "Nitrate", "Phosphate", "Faecal.Coliforms", "Escherichia.coli", "Enterococci") #, "Shannon", "Simpson"
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
      cat("\n Shapiro-Wilk Test for Normality for ", var," \n")
      print(test_result)
      print("Reject the null hypothesis, data is not normally distributed")
      print("============================================================================")
    } else {
      cat("\n Shapiro-Wilk Test for Normality for ", var,"\n")
      print(test_result)
      print("Fail to reject the null hypothesis, data is normally distributed")
      print("============================================================================")
      }
    }
  }


for (var in testVars){
  qqnorm(data[[var]], main=paste("Q-Q plot of", var))
    qqline(data[[var]])
}
#qq plots w/ line


library("car")
results <- list()
levene_pf <- list()
for (var in testVars) {
  if (is.numeric(data[[var]])) {
    testFormula <- as.formula(paste(var, "~ Site"))
    leveneResult <- leveneTest(testFormula, data = data)
    results[[var]] <- leveneResult
    levene_pf[[var]] <- leveneResult$`Pr(>F)`[1]
  } else {
    cat("\nSkipping", var, "as it is not a numeric variable.\n")
  }
}
#test homogeneity of variance w/ levenme


for (var in names(results)){
  cat("\n Levene's Test for Homogeneity of Variance for ", var, "\n")
  print(results[[var]])
  if (levene_pf[[var]] < 0.05) {
    print("Reject the null hypothesis, variances are not homogeneous")
  } else {
    print("Fail to reject the null hypothesis, variances are homogeneous")
  }
  print("============================================================================")
}
#print each result for levene

testVars <- c("Distance.From.Outflow", "ASPT", "Temperature", "pH", "DO", "TDS", "Nitrate", "Phosphate", "Faecal.Coliforms", "Escherichia.coli", "Enterococci") #, "Shannon", "Simpson"
#include distance as not needed to test for normality etc