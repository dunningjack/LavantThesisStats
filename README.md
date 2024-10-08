# River Lavant Thesis Project
### UP2005525
## Premise
The project, working at the  University of Portsmouth, aims to quantify the impact of a sewage treatment plant on the physicochemical parameters and the macroinvertebrate response to these.
Data was collected using a EuTech PCD650 probe for DO/Temperature/pH/TDS, Hanna Instruments Nitrate and Phosphate Checkers, and NHBS Kick nets for samples.

## Hypotheses
1.	Measures of diversity (BMWP, ASPT, Shannon, Simpson) decrease with increased nutrient concentration
2.	Measures of diversity are lower downstream of the treatment plant than upstream
3.	Sites downstream of the treatment plant exhibit different physical parameters (pH, DO, temperature, TDS) than sites upstream
4.	Nutrient concentration is higher downstream of the treatment plant than upstream.

## Data Analysis
Data is analysed using R, with a number of packages that afford the user the ability to clean data, fill in missing values, complete statistical tests and produce plots.

Data is screened for normality using a Shapiro-Wilk test, with its skew quantified and logged. It is then tested with Levene's test for homogeneity of variances. Non-normally distributed data
is log-transformed (or reverse log transformed) according to its skew, before further analysis.

## Testing hypotheses
1. Pearson Correlation Coefficient
2. Independent samples t-test
3. ANOVA
4. Independent samples t-test

Microbial data is used for some analyses, with reasoning and references provided in the submitted manuscript.

## Applications of findings
The study aims to begin quantifying the impact of treatment plants on chalk streams, providing initial data from which further testing and experiments can be based.

## How to Use
1. Ensure latest version of R is installed onto target device
2. Using suitable environment, clone the repository from VCS to the local machine. (NOTE: VSCode/DataSpell recommended)
3. Open "CompleteAnalysis.R" and execute the script
4. Allow up to 2 minutes for analysis to complete. Outputs will appear in the console as a series of test results, with histograms, box plots and QQ plots being plotted in the development environment.

In the event of issue, please raise as such under the relevant repo tab, reporting the exact error message received and details about the operating environment (OS/Version/R version/IDE version)
