load_sleep_data <- function(filepath) {
  read.csv(filepath, stringsAsFactors = FALSE)
}

prepare_sleep_data <- function(data) {
  data$Sleep.Quality <- factor(data$Sleep.Quality, ordered = TRUE, levels = 1:10)
  data$Gender <- as.factor(data$Gender)
  data$Physical.Activity.Level <- factor(
    data$Physical.Activity.Level, ordered = TRUE,
    levels = c("low", "medium", "high")
  )
  data$Dietary.Habits <- as.factor(data$Dietary.Habits)
  data$Sleep.Disorders <- as.factor(data$Sleep.Disorders)
  data$Medication.Usage <- as.factor(data$Medication.Usage)

  data$Bedtime1 <- strptime(paste0(data$Bedtime, ":00"), format = "%H:%M:%S")
  data$Wake.up.Time1 <- strptime(paste0(data$Wake.up.Time, ":00"), format = "%H:%M:%S")

  data$Bedtime_Numeric <- as.numeric(format(data$Bedtime1, "%H")) +
    as.numeric(format(data$Bedtime1, "%M")) / 60
  data$Wakeup_Numeric <- as.numeric(format(data$Wake.up.Time1, "%H")) +
    as.numeric(format(data$Wake.up.Time1, "%M")) / 60

  origin <- "2024-12-01"
  data$Bedtime <- as.POSIXct(
    paste(origin, data$Bedtime), format = "%Y-%m-%d %H:%M", tz = "UTC"
  )
  data$Wake.up.Time <- as.POSIXct(
    paste(origin, data$Wake.up.Time), format = "%Y-%m-%d %H:%M", tz = "UTC"
  )

  overnight <- data$Wake.up.Time < data$Bedtime
  data$Wake.up.Time[overnight] <- data$Wake.up.Time[overnight] + 86400

  data$dur <- as.numeric(difftime(
    data$Wake.up.Time, data$Bedtime, units = "hours"
  ))

  bedtime_hour <- as.numeric(format(data$Bedtime, "%H"))
  wake_hour <- as.numeric(format(data$Wake.up.Time, "%H"))

  data$goodbed <- ifelse(bedtime_hour >= 22 & bedtime_hour < 24, 1, 0)
  data$goodwake <- ifelse(wake_hour >= 3 & wake_hour < 9, 1, 0)

  data
}
