plot_sleep_histograms <- function(data) {
  plots <- list(
    ggplot(data, aes(x = dur)) +
      geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of Sleep Duration",
           x = "Sleep Duration (hours)", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = goodwake)) +
      geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of goodwake", x = "goodwake", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = goodbed)) +
      geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of goodbed", x = "goodbed", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Bedtime_Numeric)) +
      geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of Bedtime", x = "Bedtime (hours)", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Wakeup_Numeric)) +
      geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of Wake-up Time", x = "Wake-up Time (hours)", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Age)) +
      geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of Age", x = "Age (years)", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Gender)) +
      geom_bar(fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Distribution of Gender", x = "Gender", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Daily.Steps)) +
      geom_histogram(binwidth = 1000, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of Daily Steps", x = "Daily Steps", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Calories.Burned)) +
      geom_histogram(binwidth = 50, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Histogram of Calories Burned", x = "Calories Burned", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Physical.Activity.Level)) +
      geom_bar(fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Distribution of Physical Activity Level",
           x = "Physical Activity Level", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Dietary.Habits)) +
      geom_bar(fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Distribution of Dietary Habits",
           x = "Dietary Habits", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Sleep.Disorders)) +
      geom_bar(fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Distribution of Sleep Disorders",
           x = "Sleep Disorders", y = "Frequency") +
      theme_minimal(),

    ggplot(data, aes(x = Medication.Usage)) +
      geom_bar(fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "Distribution of Medication Usage",
           x = "Medication Usage", y = "Frequency") +
      theme_minimal()
  )

  gridExtra::grid.arrange(grobs = plots, ncol = 3)
}

plot_correlation_matrix <- function(cor_matrix) {
  corrplot::corrplot(
    cor_matrix, method = "color", type = "upper", tl.cex = 0.8
  )
}
