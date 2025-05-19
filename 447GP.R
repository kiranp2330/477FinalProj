# Load necessary packages
library(dplyr)
library(readxl) # Add this library to read Excel files
library(ggplot2)

# Load the dataset
airplane_data <- read_excel("C:/Users/kiran/Downloads/Airplane_Crashes_and_Fatalities_Since_1908_20190820105639.csv/Airplane_Crashes_and_Fatalities_Since_1908_INST462_Cleaned.xlsx")

# Convert 'Date' to a numerical representation (e.g., days since the epoch)
airplane_data$Date_Num <- as.numeric(as.Date(airplane_data$Date, format = "%m/%d/%Y"))

# Extract 'Decade' for trend analysis
airplane_data <- airplane_data %>%
  mutate(Decade = floor(as.numeric(format(as.Date(Date, format="%m/%d/%Y"), "%Y")) / 10) * 10)

# Extract 'HourOfDay' from 'Time' for Research Question 3 (handle missing/inconsistent times)
# This will require careful handling of the 'Time' column due to the format
# For now, let's just try a basic extraction, acknowledging it might need more work
airplane_data <- airplane_data %>%
  mutate(HourOfDay = as.numeric(substr(Time, 1, 2))) # Assuming HH:MM format, needs cleaning

# Descriptive statistics for numerical variables
summary(airplane_data$Aboard)
summary(airplane_data$Fatalities)
summary(airplane_data$Date_Num) # Include the numerical date
summary(airplane_data$Decade)
summary(airplane_data$HourOfDay)


# Frequency table for categorical variables
table(airplane_data$Decade)

# Graph 1: Trend of crashes over time
crash_trend_plot <- ggplot(airplane_data, aes(x = as.factor(Decade))) +
  geom_bar() +
  labs(title = "Frequency of Airplane Crashes by Decade",
       x = "Decade",
       y = "Number of Crashes") +
  theme_minimal()
print(crash_trend_plot)

# Graph 2: Scatter plot of 'Aboard' vs 'Fatalities'
aboard_fatalities_plot <- ggplot(airplane_data, aes(x = Aboard, y = Fatalities)) +
  geom_point() +
  labs(title = "Relationship between Passengers and Fatalities",
       x = "Number of People Aboard",
       y = "Number of Fatalities") +
  theme_minimal()
print(aboard_fatalities_plot)

# Graph 3: Distribution of crashes by Year
crash_by_year_plot <- ggplot(airplane_data, aes(x = as.numeric(format(as.Date(Date, format="%m/%d/%Y"), "%Y")))) +
  geom_bar() +
  labs(title = "Crashes by Year",
       x = "Year",
       y = "Number of Crashes") +
  theme_minimal()
print(crash_by_year_plot)

