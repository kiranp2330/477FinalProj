# Load necessary packages
library(dplyr)
library(readxl)
library(ggplot2)

# Load the dataset
airplane_data <- read_excel("C:/Users/kiran/Downloads/Airplane_Crashes_and_Fatalities_Since_1908_20190820105639.csv/Airplane_Crashes_and_Fatalities_Since_1908_INST462_Cleaned.xlsx")

# Data Cleaning and Preparation

# Convert 'Date' to a numerical representation
airplane_data$Date_Num <- as.numeric(as.Date(airplane_data$Date, format = "%m/%d/%Y"))

# Extract 'Decade' and 'Year'
airplane_data <- airplane_data %>%
  mutate(
    Decade = floor(as.numeric(format(as.Date(Date, format = "%m/%d/%Y"), "%Y")) / 10) * 10,
    Year = as.numeric(format(as.Date(Date, format = "%m/%d/%Y"), "%Y"))
  )

# Extract 'HourOfDay' from 'Time'
airplane_data <- airplane_data %>%
  mutate(HourOfDay = as.numeric(substr(Time, 1, 2)))

# --- Key Data Cleaning Step ---
# Remove rows where 'Fatalities' or 'Aboard' have missing values
airplane_data <- airplane_data %>%
  filter(!is.na(Fatalities) & !is.na(Aboard))

# Convert 'Fatalities' and 'Aboard' to numeric (after removing missing values)
airplane_data$Fatalities <- as.numeric(airplane_data$Fatalities)
airplane_data$Aboard <- as.numeric(airplane_data$Aboard)

# Check the structure of the data after cleaning
str(airplane_data) # This will help you verify the data types

# Descriptive statistics
summary(airplane_data$Aboard)
summary(airplane_data$Fatalities)
summary(airplane_data$Date_Num)
summary(airplane_data$Decade)
summary(airplane_data$HourOfDay)

# Frequency table for Decade
table(airplane_data$Decade)

# Graph 1: Trend of crashes over time
crash_trend_plot <- ggplot(airplane_data, aes(x = as.factor(Decade))) +
  geom_bar() +
  labs(
    title = "Frequency of Airplane Crashes by Decade",
    x = "Decade",
    y = "Number of Crashes"
  ) +
  theme_minimal()
print(crash_trend_plot)

# Graph 2: Scatter plot of 'Aboard' vs 'Fatalities'
aboard_fatalities_plot <- ggplot(airplane_data, aes(x = Aboard, y = Fatalities)) +
  geom_point() +
  labs(
    title = "Relationship between Passengers and Fatalities",
    x = "Number of People Aboard",
    y = "Number of Fatalities"
  ) +
  theme_minimal()
print(aboard_fatalities_plot)

# Graph 3: Distribution of crashes by Year
crash_by_year_plot <- ggplot(airplane_data, aes(x = Year)) +
  geom_bar() +
  labs(
    title = "Crashes by Year",
    x = "Year",
    y = "Number of Crashes"
  ) +
  theme_minimal()
print(crash_by_year_plot)


# --- Analysis for Deliverable 3 ---

# Hypothesis 1: ANOVA for Fatalities by Decade
anova_result <- aov(Fatalities ~ as.factor(Decade), data = airplane_data)
summary(anova_result) # Print ANOVA table
tukey_result <- TukeyHSD(anova_result) # Perform Tukey's HSD post-hoc test
print(tukey_result) # Print Tukey's results

# Hypothesis 2: Correlation between Aboard and Fatalities
correlation_test <- cor.test(airplane_data$Aboard, airplane_data$Fatalities)
print(correlation_test) # Print correlation test results

# Hypothesis 3: Simple Linear Regression
regression_model <- lm(Fatalities ~ Aboard, data = airplane_data)
summary(regression_model) # Print regression summary


