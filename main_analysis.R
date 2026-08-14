# Sleep Quality Ordinal Logistic Regression
# Main analysis script

# Install once if needed:
# install.packages(c(
# "hms", "corrplot", "caret", "dplyr", "VGAM", "gridExtra", "car", "lubridate",
#   "ggplot2"
# ))

library(hms)
library(corrplot)
library(caret)
library(VGAM)
library(car)
library(lubridate)
library(ggplot2)
library(gridExtra)
library(dplyr)

source("src/data_processing.R")
source("src/eda.R")
source("src/visualization.R")
source("src/modeling.R")
source("src/evaluation.R")

# 1. Load and prepare data
filepath <- "data/Sleep_Quality_Dataset.csv"
data <- load_sleep_data(filepath)

print(summary(data))
data <- prepare_sleep_data(data)

# 2. Exploratory analysis
data_combined <- build_correlation_data(data)
cor_matrix <- calculate_correlations(data_combined)

print(find_high_correlations(cor_matrix, threshold = 0.7))

plot_correlation_matrix(cor_matrix)
plot_sleep_histograms(data)

# 3. Ordinal logistic regression
models <- fit_ordinal_models(data)
print_model_summaries(models)

# 4. Likelihood-ratio test
lrt_result <- compare_simplified_to_null(models)

cat("\n=== Likelihood Ratio Test: Simplified vs Null ===\n")
print(lrt_result)
