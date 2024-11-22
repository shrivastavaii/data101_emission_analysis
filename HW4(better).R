# Load the data
GAdata <- read.csv("climate_change_impact_on_agriculture_2024.csv")

# Define thresholds
low_precipitation_threshold <- quantile(GAdata$Total_Precipitation_mm, 0.25, na.rm = TRUE)  # 25th percentile for low precipitation
high_impact_threshold <- quantile(GAdata$Economic_Impact_Million_USD, 0.75, na.rm = TRUE) # 75th percentile for high economic impact

# Filter data to only include rows with low precipitation
low_precipitation_data <- subset(GAdata, Total_Precipitation_mm <= low_precipitation_threshold)

# Step 1: Calculate Prior Probability of using Drought Resistant Crops in low precipitation areas
Prior <- nrow(low_precipitation_data[low_precipitation_data$Adaptation_Strategies == 'Drought-resistant Crops', ]) / 
  nrow(low_precipitation_data)
PriorOdds <- round(Prior / (1 - Prior), 2)  # Calculate Prior Odds
cat("Prior Odds of using Drought Resistant Crops in Low Precipitation Areas:", PriorOdds, "\n")

# Step 2: Calculate True Positive Rate
# Probability of high economic impact given Drought Resistant Crops in low precipitation areas
TruePositive <- round(
  nrow(low_precipitation_data[low_precipitation_data$Adaptation_Strategies == 'Drought-resistant Crops' & 
                                low_precipitation_data$Economic_Impact_Million_USD > high_impact_threshold, ]) / 
    nrow(low_precipitation_data[low_precipitation_data$Adaptation_Strategies == 'Drought-resistant Crops', ]), 2)
cat("True Positive Rate (High Impact | Drought Resistant Crops in Low Precipitation):", TruePositive, "\n")

# Step 3: Calculate False Positive Rate
# Probability of high economic impact given other strategies in low precipitation areas
FalsePositive <- round(
  nrow(low_precipitation_data[low_precipitation_data$Adaptation_Strategies != 'Drought-resistant Crops' & 
                                low_precipitation_data$Economic_Impact_Million_USD > high_impact_threshold, ]) / 
    nrow(low_precipitation_data[low_precipitation_data$Adaptation_Strategies != 'Drought-resistant Crops', ]), 2)
cat("False Positive Rate (High Impact | Not Drought Resistant Crops in Low Precipitation):", FalsePositive, "\n")

# Step 4: Calculate Likelihood Ratio
LikelihoodRatio <- round(TruePositive / FalsePositive, 2)
cat("Likelihood Ratio for Drought Resistant Crops in Low Precipitation:", LikelihoodRatio, "\n")

# Step 5: Calculate Posterior Odds and Posterior Probability
PosteriorOdds <- round(LikelihoodRatio * PriorOdds, 2)
cat("Posterior Odds of High Economic Impact given Drought Resistant Crops in Low Precipitation:", PosteriorOdds, "\n")

Posterior <- round(PosteriorOdds / (1 + PosteriorOdds), 2)
cat("Posterior Probability of High Economic Impact given Drought Resistant Crops in Low Precipitation:", Posterior, "\n")



##### Part 2:


# Build a contingency table for two categorical variables

t<-table(GAdata$Crop_Type, GAdata$Country)
cat("Contingency table of Crop Type vs Country:", "\n")
print(t)


# Define a function to calculate the likelihood ratio
calculate_likelihood_ratio <- function(table, row_i, col_j, row_k, col_l) {
  # True Positive Rate: Probability of being in cell T[i, j]
  TruePositiveRate <- table[row_i, col_j] / sum(table[row_i, ])
  
  # False Positive Rate: Probability of being in cell T[k, l]
  FalsePositiveRate <- table[row_k, col_l] / sum(table[row_k, ])
  
  # Calculate the likelihood ratio
  LikelihoodRatio <- TruePositiveRate / FalsePositiveRate
  return(LikelihoodRatio)
}

# Example: Calculate likelihood ratio for specific cells
# Choose specific rows and columns (row_i, col_j) and (row_k, col_l) for the calculation
row_i <- 1  # Example: First row (specific Crop_Type)
col_j <- 1  # Example: First column (specific Country)
row_k <- 2  # Example: Second row (another Crop_Type)
col_l <- 2  # Example: Second column (another Country)

# Calculate and display the likelihood ratio
LikelihoodRatio <- calculate_likelihood_ratio(t, row_i, col_j, row_k, col_l)
cat("The likelihood ratio for T[", row_i, ",", col_j, "] vs T[", row_k, ",", col_l, "] is:", LikelihoodRatio, "\n")
