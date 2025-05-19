# Airplane Crash Data Analysis (1908-Present)
By: Kiran Pillai and Varun Khilinani

## Project Description

This project analyzes airplane crash data from 1908 to the present to identify factors influencing crash fatalities and how crash frequency has changed.  The analysis seeks to provide insights that could be used to evaluate the effectiveness of safety regulations, identify high-risk scenarios, and improve emergency response strategies.

## Data Source

The dataset used in this analysis is "Airplane Crash Data Since 1908."

## Key Variables

The dataset includes the following variables:

* **Date:** Date of the crash.
* **Time:** Time of the crash.
* **Location:** Location of the crash.
* **Operator:** Operator of the aircraft.
* **Flight #:** Flight identification number.
* **Route:** Flight route.
* **AC Type:** Aircraft type.
* **Registration:** Aircraft registration number.
* **cn/ln:** Construction number/line number.
* **Aboard:** Total number of people on board (passengers and crew).
* **Aboard Passengers:** Number of passengers on board.
* **Aboard Crew:** Number of crew members on board.
* **Fatalities:** Number of fatalities.
* **Fatalities Passengers:** Number of passenger fatalities.
* **Fatalities Crew:** Number of crew fatalities.
* **Ground:** Casualties on the ground
* **Summary:** Description of the crash event.
* **Decade:** Decade of the crash.
* **Year:** Year of the crash.
* **HourOfDay:** Hour of day of crash

## Analysis Performed

The analysis involved the following steps:

1.  **Data Loading and Cleaning:**
    * Loaded data from three Excel files.
    * Concatenated the data into a single DataFrame.
    * Removed rows with missing values in 'Fatalities' or 'Aboard'.
    * Converted `Fatalities` and `Aboard` to numeric types.
    * Extracted `Decade`, `Year`, and `HourOfDay` from the `Date` and `Time` columns.

2.  **Descriptive Statistics:**
    * Calculated descriptive statistics for key variables (`Aboard`, `Fatalities`, `Decade`, `Year`, `HourOfDay`).
    * Generated a frequency table for the `Decade` variable.
    * Created visualizations

3.  **Hypothesis Testing:**
    * **Hypothesis 1:** Tested if average fatalities differ significantly across different decades using ANOVA.  Post-hoc tests (Tukey's HSD) were performed if the ANOVA was significant.
    * **Hypothesis 2:** Examined the relationship between the number of people aboard and the number of fatalities using Pearson's correlation coefficient.
    * **Hypothesis 3:** Built a simple linear regression model to predict the number of fatalities based on the number of people aboard.

## Hypotheses

The following hypotheses were tested:

1.  H1: The average number of fatalities differs significantly across different decades.

2.  H2: There is a statistically significant linear relationship between the number of people aboard an aircraft and the number of fatalities.

3.  H3: The number of people aboard an aircraft is a significant predictor of the number of fatalities.

## Results

* **Hypothesis 1:** The average number of fatalities varies significantly across different decades.

* **Hypothesis 2:** There is a strong, positive, and statistically significant linear relationship between the number of people aboard an aircraft and the number of fatalities.

* **Hypothesis 3:** The number of people aboard an aircraft is a significant predictor of the number of fatalities.

## Interpretation

The analysis provides insights into how crash fatalities and frequency have changed over time and the relationship between the number of people aboard and the number of fatalities.  These findings can be used to inform efforts to improve air safety.
