# Sleep Quality Adjacent Categories Logistic Regression

This repository features a modular statistical modelling pipeline for analysing **sleep quality as an ordinal outcome**, using demographic, lifestyle, physical activity, dietary, medication, and sleep-related variables.

## Methodology & Features

* **Data Processing & Feature Engineering:** Converts categorical variables to ordered factors, processes bedtime and wake-up times, accounts for overnight sleep, and derives sleep duration and timing indicators.

* **Exploratory Data Analysis:** Examines variable distributions and relationships through histograms, dummy-variable encoding, and correlation analysis.

* **Ordinal Regression Modeling:** Develops and compares three Adjacent Categories Logistic Regression (ACAT) models with different predictor specifications using the `VGAM` framework.

* **Model Comparison:** Compares the fitted models against an intercept-only null model using a likelihood-ratio test.

## Models

**Model 1 — Full:** Age, Gender, Daily Steps, Calories Burned, Physical Activity Level, Dietary Habits, Medication Usage, sleep duration, and good bedtime.
**Model 2 — Without Physical Activity:** removes Physical Activity Level
and adds Sleep Disorders.
**Model 3 — Simplified:** Gender, Sleep Disorders, and Age.
**Null:** intercept only.

## Repository Structure

* `src/data_processing.R` — Data cleaning, categorical transformation, and sleep-related feature engineering.
* `src/eda.R` — Dummy-variable construction and correlation analysis.
* `src/visualization.R` — Histograms and correlation visualisations.
* `src/modeling.R` — Ordinal logistic regression model specifications.
* `src/evaluation.R` — Model summaries and likelihood-ratio testing.
* `main_analysis.R` — Main execution script running the complete analysis.
