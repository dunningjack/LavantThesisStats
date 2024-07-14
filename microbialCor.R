cor_res <- cor.test(data$Nitrate, data$Faecal.Coliforms, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Faecal Coliforms and Nitrate\n")
  cat("Correlation coefficient:", cor_res$estimate, "t-value:", cor_res$statistic, "p-value:", cor_res$p.value, "\n")
  print("============================================================================ \n \n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Faecal Coliforms and Nitrate\n")
    print("============================================================================ \n \n")
}
#test correlation between nitrate and faecal coliforms

cor_res <- cor.test(data$Nitrate, data$Escherichia.coli, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Escherichia coli and Nitrate\n")
  cat("Correlation coefficient:", cor_res$estimate, "t-value:", cor_res$statistic, "p-value:", cor_res$p.value, "\n")
  print("============================================================================ \n \n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Escherichia coli and Nitrate\n")
    print("============================================================================ \n \n")
}
#test correlation between nitrate and escherichia coli

cor_res <- cor.test(data$Nitrate, data$Enterococci, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Enterococci and Nitrate\n")
  cat("Correlation coefficient:", cor_res$estimate, "t-value:", cor_res$statistic, "p-value:", cor_res$p.value, "\n")
    print("============================================================================ \n \n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Enterococci and Nitrate\n")
    print("============================================================================ \n \n")
}
#test correlation between nitrate and enterococci


cor_res <- cor.test(data$Phosphate, data$Faecal.Coliforms, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Faecal Coliforms and Phosphate\n")
  cat("Correlation coefficient:", cor_res$estimate, "t-value:", cor_res$statistic, "p-value:", cor_res$p.value, "\n")
    print("============================================================================ \n \n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Faecal Coliforms and Phosphate\n")
    print("============================================================================ \n \n")
}
#test correlation between phosphate and faecal coliforms

cor_res <- cor.test(data$Phosphate, data$Escherichia.coli, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Escherichia coli and Phosphate\n")
  cat("Correlation coefficient:", cor_res$estimate, "t-value:", cor_res$statistic, "p-value:", cor_res$p.value, "\n")
  print("============================================================================ \n \n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Escherichia coli and Phosphate\n")
  print("============================================================================ \n \n")
}
#test correlation between phosphate and escherichia coli

cor_res <- cor.test(data$Phosphate, data$Enterococci, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Enterococci and Phosphate\n")
  cat("Correlation coefficient:", cor_res$estimate, "t-value:", cor_res$statistic, "p-value:", cor_res$p.value, "\n")
    print("============================================================================ \n \n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Enterococci and Phosphate\n")
    print("============================================================================ \n \n")
}
#test correlation between phosphate and enterococci