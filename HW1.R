# Read in the data
GAdata <- read.csv("climate_change_impact_on_agriculture_2024.csv")

#use this to compare when finding "high occurrences"
nrow(GAdata)


#############

# Create mosaic plot for country vs crop type
colors<- c('red','blue','cyan','yellow','green') 
mosaicplot(GAdata$Country~GAdata$Crop_Type,xlab = 'Country',ylab = 'Crop', main = "Mosiac of country vs types of crops grown",col=colors,border="black")

# Make boxplot of CO2 emissions to see median value
boxplot(CO2_Emissions_MT ~ Crop_Type, data=GAdata, ylab="CO2 Emissions (MT)", main="Boxplot of CO2 Emissions by Crop", col="darkgreen", border="black")

# Get the median values
median_CO2 <- median(GAdata$CO2_Emissions_MT)

# Subset data where CO2 emissions are greater than the median value
high_CO2_data <- subset(GAdata, CO2_Emissions_MT > median_CO2)

# Create table of crops vs emissions that are greater than the median value
crops_vs_CO2 <- table(high_CO2_data$Crop_Type, high_CO2_data$CO2_Emissions_MT)

# Create frequency table for crops with CO2 emissions > median
crop_freq <- table(high_CO2_data$Crop_Type)

# Find the maximum frequency
max_freq <- max(crop_freq)

# Identify the crop with the maximum frequency
max_freq_crop 

# For the clickbait title, find the total amount of emissions of the maximum frequency crop
total_max_freq_emissions <- sum(high_CO2_data$CO2_Emissions_MT[high_CO2_data$Crop_Type == max_freq_crop])
print(total_max_freq_emissions)


# Create a bar plot of crop frequency
barplot(crop_freq, main="Frequency Distribution of Crops with High CO2 Emissions", xlab="Crops", ylab="Frequency", col = 
          "darkgreen", border = "black")
 #this is showing that there isn't a large difference among all the crops, so although vegetables is thie highest, the difference may not be extremely meaningful 

#################

# Create a table
crop_weather_table <- table(GAdata$Crop_Yield_MT_per_HA, GAdata$Extreme_Weather_Events, GAdata$Total_Precipitation_mm)

# Find high values (= above the median) 
median_rainfall <- median(GAdata$Total_Precipitation_mm)
median_yield <- median(GAdata$Crop_Yield_MT_per_HA)
median_events <- median(GAdata$Extreme_Weather_Events)

# Subset for high rainfall and high crop yields
high_rainfall_yield <- subset(GAdata, Total_Precipitation_mm > median_rainfall & Crop_Yield_MT_per_HA > median_yield)

# Check the number of occurrences
n_high_rainfall_yield <- nrow(high_rainfall_yield)
n_high_rainfall_yield  
#this is giving out a high value (2532), meaning there is a relationship between high rainfall and high crop yield


# Check if these high-yielding crops have high rainfall AND a lot of extreme weather
high_yielding_extreme_weather <- subset(GAdata, 
                                        Crop_Yield_MT_per_HA > median_yield & 
                                          Total_Precipitation_mm > median_rainfall & 
                                          Extreme_Weather_Events > median_events)

# Check the number of occurrences
n_high_yield_extreme_weather <- nrow(high_yielding_extreme_weather)
n_high_yield_extreme_weather  # This will show the count of such crops
#this is giving out a high value (1174), meaning there is a relationship between high rainfall and high crop yield and extreme events

# Print out such crops
print(unique(high_yielding_extreme_weather$Crop_Type))

# Create a scatter plot of Crop Yield vs. Rainfall
plot(GAdata$Total_Precipitation_mm, GAdata$Crop_Yield_MT_per_HA, xlab = "Total Precipitation (mm)", ylab = "Crop Yield (MT per HA)", main = "Scatter Plot of Crop Yield vs. Rainfall", col = "green")

##############

# Get high yielding crops
high_yield_crops <- subset(GAdata, Crop_Yield_MT_per_HA > median_yield)

# Get economic impact for these high yielding crops
economic_impact_high_yield <- high_yield_crops$Economic_Impact_Million_USD


# Used the summary function to find the breaks for the cut function below 
# summary(economic_impact_high_yield) 

# Try using CUT function learned in class
# Create impact categories and see where the above data falls
ImpactCategory <- cut(economic_impact_high_yield, breaks = c(0, 500, 900, 2000), labels = c("Low", "Medium", "High"))
table(ImpactCategory)
# the majority of them fall in the high category, suggesting that high yield crops usually have a high economic impact

# Create a scatter plot of Crop Yield vs. Economic Impact
plot(GAdata$Crop_Yield_MT_per_HA, GAdata$Economic_Impact_Million_USD, xlab = "Crop Yield (MT per HA)", ylab = "Economic Impact (Millio USD)", main = "Scatter Plot of Crop Yield vs. Economic Impact", col = "darkgreen")
# Shows trend that as crop yield increases, it has a higher economic impact!

########

head(GAdata)

