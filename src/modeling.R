fit_ordinal_models <- function(data) {
  model1 <- VGAM::vglm(
    Sleep.Quality ~ Age + Gender + Daily.Steps + Calories.Burned +
      Physical.Activity.Level + Dietary.Habits + Medication.Usage +
      dur + goodbed,
    family = VGAM::acat(parallel = TRUE, reverse = TRUE),
    data = data
  )

  model2 <- VGAM::vglm(
    Sleep.Quality ~ Age + Gender + Daily.Steps + Calories.Burned +
      Dietary.Habits + Sleep.Disorders + Medication.Usage +
      dur + goodbed,
    family = VGAM::acat(parallel = TRUE, reverse = TRUE),
    data = data
  )

  model3 <- VGAM::vglm(
    Sleep.Quality ~ Gender + Sleep.Disorders + Age,
    family = VGAM::acat(parallel = TRUE, reverse = TRUE),
    data = data
  )

  model_null <- VGAM::vglm(
    Sleep.Quality ~ 1,
    family = VGAM::acat(parallel = TRUE, reverse = TRUE),
    data = data
  )

  list(
    full = model1,
    without_physical_activity = model2,
    simplified = model3,
    null = model_null
  )
}
