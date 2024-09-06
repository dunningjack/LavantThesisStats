data_transformed <- data_transformed %>%
  mutate(SiteGroup = if_else(str_detect(Site, "^DS"), "DS", "US"))
#mark each site as up or downstream

USDS_Differences <- data.frame(Variable=character(), Difference=character(), t.value=character(), p.value=numeric())

for (var in transformedVars){
  ttest_result <- t.test(data_transformed[[var]] ~ data_transformed$SiteGroup, var.equal=TRUE)
  #independent samples, variances homogeneous as tested previously

  if (ttest_result$p.value < 0.05) {
    USDS_Differences <- rbind(USDS_Differences, data.frame(Variable=paste0(var, "*"), Difference="Significant", t.value=ttest_result$statistic, p.value=ttest_result$p.value))
  } else {
    USDS_Differences <- rbind(USDS_Differences, data.frame(Variable=var, Difference="Not Significant", t.value=ttest_result$statistic, p.value=ttest_result$p.value))
  }
}
cat("\nSummary of differences between US and DS\n")
print(USDS_Differences)