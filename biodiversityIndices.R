biodivIndices <- c("ASPT_transformed", "Shannon_transformed", "Simpson_transformed")

ggplot(data_transformed, aes(x=Site, y=Shannon_transformed)) +
  geom_boxplot() +
  geom_jitter(width = 0.2) +
  labs(title = "Shannon Diversity Index by Site", x = "Site", y = "Shannon Diversity Index")

for (indices in biodivIndices){
    anova_res <- aov(data_transformed[[indices]] ~ SiteGroup, data = data_transformed)
    tukey <- TukeyHSD(anova_res)
    cat("Tukey's HSD US-DS for ", indices, "\n")
    print(tukey)
}


for (indices in biodivIndices){
    anova_res <- aov(data_transformed[[indices]] ~ Site, data = data_transformed)
    tukey <- TukeyHSD(anova_res)
    cat("Tukey's HSD for ", indices, "\n")
    print(tukey)

}
#anova and tukey post hoc for differences between sites for biodiversity indices

bioCor <- data.frame(Variable=character(), Correlation=character(), Significant=character(), t.value=character(), p.value=numeric())
testVars <- c("Nitrate_transformed", "Phosphate_transformed", "TDS_transformed", "DO_transformed", "Temperature_transformed", "pH_transformed")

for (indices in biodivIndices){
    for (var in testVars){
        cor_res <- cor.test(data_transformed[[indices]], data_transformed[[var]], method = "pearson")
        if (cor_res$p.value < 0.05) {
            bioCor <- rbind(bioCor, data.frame(Variable=paste0(indices, " vs ", var), Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
        }  else {
            bioCor <- rbind(bioCor, data.frame(Variable=paste0(indices, " vs ", var), Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
        }
    }
}
print(bioCor)