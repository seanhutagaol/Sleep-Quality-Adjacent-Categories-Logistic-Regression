create_dummy_data <- function(data) {
  model.matrix(
    ~ Gender + Dietary.Habits + Physical.Activity.Level +
      Sleep.Disorders + Medication.Usage - 1,
    data = data
  )
}

build_correlation_data <- function(data) {
  dummy_data <- create_dummy_data(data)

  cbind(
    data[, c(
      "Age", "Bedtime_Numeric", "Wakeup_Numeric", "Sleep.Quality",
      "Daily.Steps", "Calories.Burned", "dur", "goodbed"
    )],
    dummy_data
  )
}

calculate_correlations <- function(data_combined) {
  cor(
    data_combined[, names(data_combined) != "Sleep.Quality", drop = FALSE],
    use = "complete.obs"
  )
}

find_high_correlations <- function(cor_matrix, threshold = 0.7) {
  idx <- which(
    abs(cor_matrix) > threshold & abs(cor_matrix) < 1,
    arr.ind = TRUE
  )

  if (nrow(idx) == 0) {
    return(data.frame(
      Variable1 = character(),
      Variable2 = character(),
      Correlation = numeric()
    ))
  }

  pairs <- data.frame(
    Variable1 = rownames(cor_matrix)[idx[, 1]],
    Variable2 = colnames(cor_matrix)[idx[, 2]],
    Correlation = cor_matrix[idx]
  )

  pairs[!duplicated(
    t(apply(pairs[, c("Variable1", "Variable2")], 1, sort))
  ), ]
}
