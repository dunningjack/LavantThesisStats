source("Init.R")

reflect_log_transform <- function(x) {
  log(max(x, na.rm = TRUE) - x + 1)
}
#reflect log transform for negative skewed data
#normal log transform for positive skewed data

# Apply transformations
data_transformed <- data %>%
  mutate(
    ASPT_transformed = ASPT,
    Shannon_transformed = reflect_log_transform(Shannon),
    Simpson_transformed = reflect_log_transform(Simpson),
    pH_transformed = reflect_log_transform(pH),
    Temperature_transformed = Temperature,
    DO_transformed = DO,
    Nitrate_transformed = Nitrate,
    TDS_transformed = log(TDS + 1),
    Phosphate_transformed = log(Phosphate + 1),
    Faecal_Coliforms_transformed = log(Faecal.Coliforms + 1),
    Escherichia_coli_transformed = log(Escherichia.coli + 1),
    Enterococci_transformed = log(Enterococci + 1)
  )

transformedVars <- c("ASPT_transformed", "Shannon_transformed", "Simpson_transformed", "pH_transformed", "Temperature_transformed", "DO_transformed", "TDS_transformed", "Nitrate_transformed", "Phosphate_transformed", "Faecal_Coliforms_transformed", "Escherichia_coli_transformed", "Enterococci_transformed")

for (var in transformedVars){
  data_transformed[[var]] <- as.numeric(data_transformed[[var]])
}
#store all columns as numeric