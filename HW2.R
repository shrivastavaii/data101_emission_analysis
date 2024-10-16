# install and import necessary libraries
install.packages("devtools")
library(devtools)
devtools::install_github("janish-parikh/ZTest")
library(HypothesisTesting)



# Load the data
GAdata <- read.csv("climate_change_impact_on_agriculture_2024.csv")





######### - PART A, HYPOTHESIS TESTING
# Hypothesis 1: Adaptation Strategies and Economic Impact


# Calculate means of economic impact by adaptation strategy
mean_yields <- tapply(GAdata$Economic_Impact_Million_USD, GAdata$Adaptation_Strategies, mean)
print(mean_yields)


## null hypothesis = drought resistant crops having a higher economic outcome than crops with water management
strong_perm_1 <- permutation_test(GAdata, "Adaptation_Strategies", "Economic_Impact_Million_USD", 10000, "Water Management", "Drought-resistant Crops")
cat("The p-value of the hypothesis is equal to:", strong_perm_1)
# p = 0.004

strong_z_1 <- z_test_from_data(GAdata, "Adaptation_Strategies", "Economic_Impact_Million_USD", "Water Management", "Drought-resistant Crops")
cat("The p-value of the hypothesis is equal to:", strong_z_1)
# p = 0.018


## null hypothesis = drought resistant crops having a higher economic outcome than crops with no adaptation
closecall_perm_1 <- permutation_test(GAdata, "Adaptation_Strategies", "Economic_Impact_Million_USD", 10000, "No Adaptation", "Drought-resistant Crops")
cat("The p-value of the hypothesis is equal to:", closecall_perm_1)
# p = 0.2075

closecall_z_1 <- z_test_from_data(GAdata, "Adaptation_Strategies", "Economic_Impact_Million_USD", "No Adaptation", "Drought-resistant Crops")
cat("The p-value of the hypothesis is equal to:", closecall_z_1)
# p = 0.26


## null hypothesis = organic crops having a higher economic outcome than drought resistant crops
fail_perm_1 <- permutation_test(GAdata, "Adaptation_Strategies", "Economic_Impact_Million_USD", 10000, "Drought-resistant Crops", "Organic Farming")
cat("The p-value of the hypothesis is equal to:", fail_perm_1)
# p = 0.98

fail_z_1 <- z_test_from_data(GAdata, "Adaptation_Strategies", "Economic_Impact_Million_USD", "Drought-resistant Crops", "Organic Farming")
cat("The p-value of the hypothesis is equal to:", fail_z_1)
# p = 0.95



#########
# Hypothesis 2: Crop Type and Fertilizer


# Calculate means of fertilizer used by crop type
mean_yields <- tapply(GAdata$Fertilizer_Use_KG_per_HA, GAdata$Crop_Type, mean)
print(mean_yields)

## null hypothesis = more kgs of fertilizer is used in fruits than barley
strong_perm_2 <- permutation_test(GAdata, "Crop_Type", "Fertilizer_Use_KG_per_HA", 10000, "Barley", "Fruits")
cat("The p-value of the hypothesis is equal to:", strong_perm_2)
# p = 0.0057


## null hypothesis = more kgs of fertilizer is used in fruits than in cotton
closecall_perm_2 <- permutation_test(GAdata, "Crop_Type", "Fertilizer_Use_KG_per_HA", 10000, "Cotton", "Fruits")
cat("The p-value of the hypothesis is equal to:", closecall_perm_2)
# p = 0.05

closecall_z_2 <- z_test_from_data(GAdata, "Crop_Type", "Economic_Impact_Million_USD", "Cotton", "Fruits")
cat("The p-value of the hypothesis is equal to:", closecall_z_2)
# p = 0.028 


## null hypothesis = more kgs of fertilizer is used in fruits than in vegetables
fail_perm_2 <- permutation_test(GAdata, "Crop_Type", "Fertilizer_Use_KG_per_HA", 10000, "Vegetables", "Fruits")
cat("The p-value of the hypothesis is equal to:", fail_perm_2)
# p = 0.079




#########
# Hypothesis 3: Country and Soil Health

# Calculate means of soil health index by country
mean_yields <- tapply(GAdata$Soil_Health_Index, GAdata$Country, mean)
print(mean_yields)

## null hypothesis = soil health of _ is better than _
strong_perm_3 <- permutation_test(GAdata, "Country", "Soil_Health_Index", 10000, "Canada", "Australia")
cat("The p-value of the hypothesis is equal to:", strong_perm_3)
# p = 0.0029


## null hypothesis = soil health of Australia is better than USA
closecall_z_3 <- z_test_from_data(GAdata, "Country", "Soil_Health_Index", "USA", "Australia")
cat("The p-value of the hypothesis is equal to:", closecall_z_3)
# p = 0.044


## null hypothesis = soil health of Nigeria is better than Australia
fail_perm_3 <- permutation_test(GAdata, "Country", "Soil_Health_Index", 10000, "Australia", "Nigeria")
cat("The p-value of the hypothesis is equal to:", fail_perm_3)
# p = 0.99

fail_z_3 <- z_test_from_data(GAdata, "Country", "Soil_Health_Index", "Australia", "Nigeria")
cat("The p-value of the hypothesis is equal to:", fail_z_3)
# p = 0.97








######### - PART B, NARROW QUERIES


max_yield_row <- GAdata[GAdata$Crop_Yield_MT_per_HA == max_yield, ]
print(max_yield_row)
# gave me the row with the highest crop yield that I can use for my narrow query



M0 <- mean(GAdata$Crop_Yield_MT_per_HA) 
cat(M0)
# M0 = 2.24

M <- mean(GAdata[GAdata$Crop_Type == 'Barley' & GAdata$Region == 'South East' & GAdata$CO2_Emissions_MT == '13.82',]$Crop_Yield_MT_per_HA)
cat(M)
# M = 5, satisfies eq1


if (M > 2 * M0) {
  cat("M satisfies eq1")
} else if (M < 1/2 * M0) {
  cat("M satisfies eq2")
} else {
  cat("M does not satisfy the extreme conditions.")
}



