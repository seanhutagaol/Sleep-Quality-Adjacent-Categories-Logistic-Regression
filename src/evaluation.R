#' Model Evaluation Module

compare_simplified_to_null <- function(models) {
  
  simplified <- models$simplified
  null_model <- models$null
  
  # Log-likelihoods
  ll_simplified <- as.numeric(logLik(simplified))
  ll_null <- as.numeric(logLik(null_model))
  
  # Number of estimated parameters
  df_simplified <- length(coef(simplified))
  df_null <- length(coef(null_model))
  
  # Likelihood-ratio statistic
  lr_stat <- 2 * (ll_simplified - ll_null)
  
  # Difference in degrees of freedom
  df_diff <- df_simplified - df_null
  
  # Chi-square p-value
  p_value <- pchisq(
    lr_stat,
    df = df_diff,
    lower.tail = FALSE
  )
  
  result <- data.frame(
    Model_Comparison = "Simplified ACAT vs Null",
    LR_Statistic = lr_stat,
    df = df_diff,
    p_value = p_value
  )
  
  return(result)
}


print_model_summaries <- function(models) {
  
  cat("=== Full ACAT Model ===\n")
  print(summary(models$full))
  
  cat("\n=== ACAT Model Without Physical Activity ===\n")
  print(summary(models$without_physical_activity))
  
  cat("\n=== Simplified ACAT Model ===\n")
  print(summary(models$simplified))
  
  cat("\n=== Null ACAT Model ===\n")
  print(summary(models$null))
}