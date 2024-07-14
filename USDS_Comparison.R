#do param vary USDS
#index scores diff at each site / USDS
#nutrient US v DS

data <- data %>%
  mutate(SiteGroup = if_else(str_detect(Site, "^DS"), "DS", "US"))
#mark each site as up or downstream

USDS_Differences <- data.frame(Variable=character(), Difference=character(), t.value=character(), p.value=numeric())

for (var in testVars){
  cat("T-test for", var, "between US and DS\n")
  ttest_result <- t.test(data[[var]] ~ data$SiteGroup, var.equal=TRUE)
  #independent samples, variances homogeneous as tested previously

  if (ttest_result$p.value < 0.05) {
    cat("Reject the null hypothesis, there is a significant difference between US and DS\n")
    USDS_Differences <- rbind(USDS_Differences, data.frame(Variable=paste0(var, "*"), Difference="Significant", t.value=ttest_result$statistic, p.value=ttest_result$p.value))
  } else {
    cat("Fail to reject the null hypothesis, there is no significant difference between US and DS\n")
    USDS_Differences <- rbind(USDS_Differences, data.frame(Variable=var, Difference="Not Significant", t.value=ttest_result$statistic, p.value=ttest_result$p.value))
  }
}
cat("\nSummary of differences between US and DS\n")
print(USDS_Differences)
