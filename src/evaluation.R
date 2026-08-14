compare_simplified_to_null <- function(models) {
  lmtest::lrtest(models$simplified, models$null)
}

print_model_summaries <- function(models) {
  cat("=== Full Model ===\n")
  print(summary(models$full))

  cat("\n=== Model Without Physical Activity ===\n")
  print(summary(models$without_physical_activity))

  cat("\n=== Simplified Model ===\n")
  print(summary(models$simplified))

  cat("\n=== Null Model ===\n")
  print(summary(models$null))
}
