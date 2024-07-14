cor_res <- cor.test(data$Nitrate, data$Faecal.Coliforms, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Faecal Coliforms and Nitrate\n")
  cat("Correlation coefficient:", cor_res$estimate, "\n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Faecal Coliforms and Nitrate\n")
}
#test correlation between nitrate and faecal coliforms

cor_res <- cor.test(data$Nitrate, data$Escherichia.coli, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Escherichia coli and Nitrate\n")
  cat("Correlation coefficient:", cor_res$estimate, "\n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Escherichia coli and Nitrate\n")
}
#test correlation between nitrate and escherichia coli

cor_res <- cor.test(data$Nitrate, data$Enterococci, method = "pearson")
if (cor_res$p.value < 0.05) {
  cat("Reject the null hypothesis, there is a significant correlation between Enterococci and Nitrate\n")
  cat("Correlation coefficient:", cor_res$estimate, "\n")
} else {
  cat("Fail to reject the null hypothesis, there is no significant correlation between Enterococci and Nitrate\n")
}
#test correlation between nitrate and enterococci
