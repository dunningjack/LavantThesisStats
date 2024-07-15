#do param vary by site
#aspt impacted by ??

physdata <- data.frame(Site=character(), Variable=character(), F=character(), p=character())

manova_res <- manova(cbind(Temperature_transformed, DO_transformed, TDS_transformed) ~ Site, data = data_transformed)
#determine if difference between sites for physicochemical variables

anovaTables <- list()
tukeyResults <- list()

testVars <- c("Temperature_transformed", "DO_transformed", "TDS_transformed")
for (var in testVars) {
  # Perform ANOVA for each variable separately
  formula <- as.formula(paste(var, "~ Site"))
  anova_res <- aov(formula, data = data_transformed)

  anovaTables[[var]] <- summary(anova_res)
  tukeyResults[[var]] <- TukeyHSD(anova_res)
  #tukey pairwise

}

# Print Tukey's HSD results
print(tukeyResults)
