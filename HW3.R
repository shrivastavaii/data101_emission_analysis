# Load necessary libraries
library(stats)

# Read in the data
GAdata <- read.csv("climate_change_impact_on_agriculture_2024.csv")

# Define numerical and categorical variables
N <- GAdata$Crop_Yield_MT_per_HA
C <- GAdata$Adaptation_Strategies



### TASK 1 ###


# Set sample percentages
sample_percents <- c(0.01, 0.05, 0.5)

# Loop through each sample size
for (percent in sample_percents) {
  # Determine sample size based on percentage
  sample_size <- round(percent * nrow(GAdata))
  
  # Sample data
  set.seed(123)  # For reproducibility
  sample_df <- GAdata[sample(nrow(GAdata), sample_size), ]
  
  ### Numerical Variable: Confidence Interval for the Mean of Crop_Yield_MT_per_HA ###
  
  # Compute the sample mean and standard deviation for Crop_Yield_MT_per_HA
  sample_mean <- mean(sample_df$Crop_Yield_MT_per_HA, na.rm = TRUE)
  sample_sd <- sd(sample_df$Crop_Yield_MT_per_HA, na.rm = TRUE)
  
  # Compute the standard error of the mean
  sem <- sample_sd / sqrt(sample_size)
  
  # Determine the critical value for a 95% confidence level
  confidence_level <- 0.95
  alpha <- 1 - confidence_level
  critical_value <- qnorm(1 - alpha / 2)
  
  # Compute the margin of error and confidence interval for the mean
  margin_of_error_mean <- critical_value * sem
  lower_bound_mean <- sample_mean - margin_of_error_mean
  upper_bound_mean <- sample_mean + margin_of_error_mean
  
  ### Categorical Variable: Confidence Interval for Proportion of "Water Management" ###
  
  # Calculate the proportion of "Water Management" in the sampled data
  prop_water_management <- mean(sample_df$Adaptation_Strategies == "Water Management", na.rm = TRUE)
  
  # Compute the standard error for the proportion
  sem_prop <- sqrt(prop_water_management * (1 - prop_water_management) / sample_size)
  
  # Compute the margin of error and confidence interval for the proportion
  margin_of_error_prop <- critical_value * sem_prop
  lower_bound_prop <- prop_water_management - margin_of_error_prop
  upper_bound_prop <- prop_water_management + margin_of_error_prop
  
  ### Print Results ###
  
  cat("Sample Percentage:", percent * 100, "%\n")
  cat("Sample Size:", sample_size, "\n")
  
  # Numerical Variable Results
  cat("Mean of Crop_Yield_MT_per_HA:", sample_mean, "\n")
  cat("Margin of Error for Mean:", margin_of_error_mean, "\n")
  cat("95% Confidence Interval for Mean: [", lower_bound_mean, ",", upper_bound_mean, "]\n")
  
  # Categorical Variable Results
  cat("Proportion of 'Water Management':", prop_water_management, "\n")
  cat("Margin of Error for Proportion:", margin_of_error_prop, "\n")
  cat("95% Confidence Interval for Proportion: [", lower_bound_prop, ",", upper_bound_prop, "]\n\n")
}

### clearly, the margins of error DECREASE as the sample size INCREASES




### TASK 2 ###

# Set sample size for initial standard deviation calculation
set.seed(123)  # For reproducibility
initial_sample_size <- 500  # Adjust based on your dataset size
sample_indices <- sample(nrow(GAdata), initial_sample_size)
sample_df <- GAdata[sample_indices, ]

# Compute the sample standard deviation for Crop_Yield_MT_per_HA
sample_sd <- sd(sample_df$Crop_Yield_MT_per_HA, na.rm = TRUE)

# Compute the sample proportion of "Water Management"
p_water_management <- mean(sample_df$Adaptation_Strategies == "Water Management", na.rm = TRUE)

# Step 1: Define desired margins of error
small_MER_mean <- 0.07  # Example margin for mean
small_MER_prop <- 0.02   # Example margin for proportion

# Step 2: Critical value for 90% confidence level
confidence_level <- 0.90
alpha <- 1 - confidence_level
z_score <- qnorm(1 - alpha / 2)

# Step 3: Compute the required sample size for the mean
required_sample_size_mean <- (z_score * sample_sd / small_MER_mean)^2

# Step 4: Compute the required sample size for the proportion
required_sample_size_prop <- (z_score^2 * p_water_management * (1 - p_water_management)) / (small_MER_prop^2)

# Print the results
cat("Sample Standard Deviation of Crop Yield:", sample_sd, "\n")
cat("Critical Value for 90% Confidence Level:", z_score, "\n")
cat("Desired Margin of Error for Mean:", small_MER_mean, "\n")
cat("Required Sample Size for Mean:", ceiling(required_sample_size_mean), "\n")
cat("Desired Margin of Error for Proportion:", small_MER_prop, "\n")
cat("Required Sample Size for Proportion:", ceiling(required_sample_size_prop), "\n")



### TASK 3 ###

# Step 1: Choose categorical variables and specific values
C1 <- "Adaptation_Strategies"  # Example categorical variable 1
C2 <- "Region"                 # Example categorical variable 2

c1 <- "Water Management"       # Specific value for C1
c2 <- "West Bengal"          # Specific value for C2

# Step 2: Extract subset of data where C1 equals c1 and C2 equals c2
S <- GAdata[GAdata[[C1]] == c1 & GAdata[[C2]] == c2, ]

# Step 3: Calculate the fraction of tuples in S where C1 equals c1 and C2 equals c2
n <- nrow(S)  # Number of tuples in subset S
total_count <- nrow(GAdata)  # Total number of tuples in the dataset
fraction <- n / total_count  # Fraction of tuples

# Step 4: Compute the standard error for the proportion
standard_error <- sqrt(fraction * (1 - fraction) / total_count)

# Step 5: Calculate the critical value for a 90% confidence level
confidence_level <- 0.90
alpha <- 1 - confidence_level
z_score <- qnorm(1 - alpha / 2)

# Step 6: Compute the margin of error and confidence interval for the fraction
margin_of_error <- z_score * standard_error
lower_bound <- fraction - margin_of_error
upper_bound <- fraction + margin_of_error

# Step 7: Print results
cat("Fraction of tuples in S where", C1, "is", c1, "and", C2, "is", c2, ":", fraction, "\n")
cat("90% Confidence Interval for the fraction: [", lower_bound, ",", upper_bound, "]\n")




### TASK 4 ###



# Step 1: Calculate minimum sample size (5% of total data)
min_sample_size <- ceiling(0.05 * nrow(GAdata))

# Variables to track the narrowest confidence interval
narrowest_width <- Inf
best_subset <- NULL
best_mean <- NA
best_lower_bound <- NA
best_upper_bound <- NA

# Step 2: Iterate through possible sample sizes starting from min_sample_size
for (sample_size in min_sample_size:nrow(GAdata)) {
  # Sample data
  set.seed(123)  # For reproducibility
  sample_indices <- sample(nrow(GAdata), sample_size)
  sample_df <- GAdata[sample_indices, ]
  
  # Compute sample mean and standard deviation for N
  sample_mean <- mean(sample_df$Crop_Yield_MT_per_HA, na.rm = TRUE)
  sample_sd <- sd(sample_df$Crop_Yield_MT_per_HA, na.rm = TRUE)
  
  # Compute the standard error of the mean
  sem <- sample_sd / sqrt(sample_size)
  
  # Critical value for a 90% confidence level
  confidence_level <- 0.90
  alpha <- 1 - confidence_level
  critical_value <- qnorm(1 - alpha / 2)
  
  # Compute margin of error and confidence interval for the mean
  margin_of_error_mean <- critical_value * sem
  lower_bound_mean <- sample_mean - margin_of_error_mean
  upper_bound_mean <- sample_mean + margin_of_error_mean
  
  # Step 3: Check if this is the narrowest confidence interval
  current_width <- upper_bound_mean - lower_bound_mean
  if (current_width < narrowest_width) {
    narrowest_width <- current_width
    best_subset <- sample_df
    best_mean <- sample_mean
    best_lower_bound <- lower_bound_mean
    best_upper_bound <- upper_bound_mean
  }
}

# Step 4: Print results
cat("Mean of Crop_Yield_MT_per_HA:", best_mean, "\n")
cat("90% Confidence Interval: [", best_lower_bound, ",", best_upper_bound, "]\n")
cat("Width of Confidence Interval:", narrowest_width, "\n")
cat("Sample Size Used:", nrow(best_subset), "\n")

