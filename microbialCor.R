microbialPearson <- data.frame(Variable=character(), Correlation=character(), Significant=character(), t.value=character(), p.value=numeric())

cor_res <- cor.test(data_transformed$Nitrate_transformed, data_transformed$Faecal_Coliforms_transformed, method = "pearson")
if (cor_res$p.value < 0.05) {
  microbialPearson <- rbind(microbialPearson, data.frame(Variable="Nitrate vs Faecal Coliforms", Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
} else {
    microbialPearson <- rbind(microbialPearson, data.frame(Variable="Nitrate vs Faecal Coliforms", Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
}
#test correlation between nitrate and faecal coliforms

cor_res <- cor.test(data_transformed$Nitrate_transformed, data_transformed$Escherichia_coli_transformed, method = "pearson")
if (cor_res$p.value < 0.05) {
  microbialPearson <- rbind(microbialPearson, data.frame(Variable="Nitrate vs Escherichia coli", Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
} else {
    microbialPearson <- rbind(microbialPearson, data.frame(Variable="Nitrate vs Escherichia coli", Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
}
#test correlation between nitrate and escherichia coli

cor_res <- cor.test(data_transformed$Nitrate_transformed, data_transformed$Enterococci_transformed, method = "pearson")
if (cor_res$p.value < 0.05) {
    microbialPearson <- rbind(microbialPearson, data.frame(Variable="Nitrate vs Enterococci", Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
    } else {
        microbialPearson <- rbind(microbialPearson, data.frame(Variable="Nitrate vs Enterococci", Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
}
#test correlation between nitrate and enterococci


cor_res <- cor.test(data_transformed$Phosphate_transformed, data_transformed$Faecal_Coliforms_transformed, method = "pearson")
if (cor_res$p.value < 0.05) {
    microbialPearson <- rbind(microbialPearson, data.frame(Variable="Phosphate vs Faecal Coliforms", Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
    } else {
        microbialPearson <- rbind(microbialPearson, data.frame(Variable="Phosphate vs Faecal Coliforms", Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
}
#test correlation between phosphate and faecal coliforms

cor_res <- cor.test(data_transformed$Phosphate_transformed, data_transformed$Escherichia_coli_transformed, method = "pearson")
if (cor_res$p.value < 0.05) {
    microbialPearson <- rbind(microbialPearson, data.frame(Variable="Phosphate vs Escherichia coli", Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
    } else {
        microbialPearson <- rbind(microbialPearson, data.frame(Variable="Phosphate vs Escherichia coli", Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
}
#test correlation between phosphate and escherichia coli

cor_res <- cor.test(data_transformed$Phosphate_transformed, data_transformed$Enterococci_transformed, method = "pearson")
if (cor_res$p.value < 0.05) {
    microbialPearson <- rbind(microbialPearson, data.frame(Variable="Phosphate vs Enterococci", Correlation="Significant", Significant="***", t.value=cor_res$statistic, p.value=cor_res$p.value))
    } else {
        microbialPearson <- rbind(microbialPearson, data.frame(Variable="Phosphate vs Enterococci", Correlation="Not Significant", Significant="", t.value=cor_res$statistic, p.value=cor_res$p.value))
}
#test correlation between phosphate and enterococci

cat("\nSummary of Pearson Correlation Tests\n")
print(microbialPearson)