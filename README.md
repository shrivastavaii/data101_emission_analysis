
https://docs.google.com/document/d/1FHOMnkSbyMoJUnvEgRDYqrdXfwr9PPWHGDuCWihZ6QY/edit?usp=sharing



Areas Associated With Growing Vegetables Release Over 10,000 Metric Tons of CO2 Emissions Per Year – Is Agriculture DESTROYING Our Planet?

Analyze the impacts of agriculture on global carbon emissions. 
Isha Shrivastava - Data 101, 10/14/24

As climate change continues to pose significant challenges to global agriculture, and vice versa, understanding the interactions between various environmental factors and crop performance is essential. The dataset I was inspecting focuses on global agriculture, with data about the general environment of the crops as well as their environmental and industrial impacts, with variables including CO2 emissions, crop yield per hectare, total precipitation, and economic effects in millions of USD. I created a mosaic plot to illustrate the relationship between countries and crop types, ensuring easier identification of any derived trends regarding international activity. 
At first glance, the data within the file indicates that certain agricultural regions are associated with higher or lower amounts of carbon emissions based on the crop they are growing. Interestingly, vegetables showed the highest frequency among crops with elevated emissions.

However, although all these crops have varying levels of total emissions, some more than others, the difference between all the values is not statistically significant. This fact becomes evident when ordering crops by emission amounts and then visualizing the data within a box plot. All the crops fall within a similar range of 10-20 metric tons of associated emissions. Therefore, although the two variables are collected and displayed within the data set, they are not necessarily directly related, mainly as a region's carbon emissions also depend on variables such as pesticides, fertilizers, cattle, and human activity. Therefore, this "pattern" is disproved, and I wanted to highlight this as it is easy to look at data and assume a correlation/causation without conducting a thorough analysis. 


High Frequencies of Extreme Weather May Lead to A Better Crop Yield
While exploring the relationship between extreme weather events, rainfall, and crop yield, the data revealed a notable correlation. A median-based approach helped filter for high rainfall and crop yield instances, resulting in 2,532 occurrences where both conditions were met. Further analysis revealed that 1,174 cases also experienced significant extreme weather events among these high-yield crops. This indicates a strong relationship between high precipitation, increased crop yield, and the frequency of extreme weather—critical information for predicting agricultural resilience under climate change.

Higher-Yielding Crops Make a Greater Contribution to the Economy
I examined the economic implications of high-yield crops as well. Using the economic impact data within the file, I categorized the high-yield crops I found earlier into low, medium, and high impact based on their economic contributions. Notably, the majority of these high-yield crops fell into the "High" impact category, emphasizing a correlation. 
A scatter plot comparing crop yield against economic impact clearly reinforced this trend, showing that as crop yield increased, so did the economic impact, demonstrating the importance of maximizing crop yields. 

Conclusion
This data analysis highlights the intricate relationships between agricultural practices, climate variables, and economic outcomes. The findings underscore the importance of considering environmental factors—such as CO2 emissions and extreme weather—and economic indicators when developing sustainable agricultural practices.

HW 2 - Hypothesis Testing:
Using hypothesis testing, I examined three hypotheses related to the impact of climate change on global agriculture. 
The first hypothesis focused on adaptation strategies and their economic outcomes. Through both permutation and z-tests, I found that drought-resistant crops significantly outperformed water management strategies economically (p = 0.004), but no significant difference was observed when comparing drought-resistant crops to no adaptation (p = 0.2075). However, this "close call" result suggests there may be economic benefits to using drought-resistant crops, though further research is needed to confirm the significance. The test comparing organic farming and drought-resistant crops yielded no significant difference (p = 0.98).
The second hypothesis explored fertilizer use across different crop types. Results revealed a significant difference between fruits and barley (p = 0.0057), but the comparison between fruits and cotton produced a borderline result (p = 0.05). No significant difference was found between fruits and vegetables (p = 0.079).
The third hypothesis investigated soil health across countries. Canada's soil health was significantly better than Australia's (p = 0.0029), while Australia had a close call in comparison to the USA (p = 0.044). Although this p-value is near the threshold for significance, it suggests that Australia's soil health might be comparable to the USA, but more data is needed to establish a stronger conclusion. There was no significant difference between Australia's and Nigeria's soil health (p = 0.99).

Based on these analyses, three potential titles for the article are:
"Do Certain Adaptation Practices Help Agriculture Industries Generate MORE Money?"
"Are Our Crops FULL of Fertilizer and Other Chemicals?"
"Global Soil Health: Some Countries Have Healthier Soil Than Others"

HW 4 - Bayesian Analysis:
In this analysis, I explored the economic impact of water adaptation strategies, focusing on whether certain strategies, like drought-resistant crops, significantly boost economic outcomes in climates where they might be most beneficial. Specifically, I created a subset limited to data where total precipitation was in the bottom 25th percentile (low precipitation), and I focused on cases with high economic impact, defined as the top 75%.
My results reveal that, in regions with low precipitation, the Prior Odds of using drought-resistant crops is 0.27. This indicates a relatively low baseline likelihood that a farm in low precipitation areas will use drought-resistant crops, regardless of economic impact. 
The True Positive Rate for high economic impact given drought-resistant crops is 0.26. This suggests that around 26% of cases using drought-resistant crops in low precipitation regions experience a high economic impact. 
The False Positive Rate for high economic impact given other strategies is 0.22. This means that 22% of cases not using drought-resistant crops (using other strategies) in low precipitation regions still see high economic impact.

The Likelihood Ratio is 1.18. This modest value indicates that high economic impact is only 1.18 times more likely when drought-resistant crops are used than when they are not, under low precipitation conditions. This relatively low likelihood ratio points to only a slight advantage in terms of economic impact for using drought-resistant crops.
The Posterior Odds and Posterior Probability of high economic impact given drought-resistant crops in low precipitation are 0.32 and 0.24 (24%), respectively. These values are close to the prior, which further suggests that the use of drought-resistant crops does not significantly increase the probability of high economic impact under these conditions.
Interpretation:
The small difference between posterior and prior odds implies that drought-resistant crops, under low precipitation, do not drastically change the probability of achieving high economic impact. This might mean that other factors, such as soil quality, fertilizer type, or crop type, could have a stronger influence on economic outcomes in these regions.

Contingency Table:


The likelihood ratio of approximately 0.83 indicates that the combination represented by cell T[1,1] (e.g., a specific crop type in a specific country) is less likely than the combination represented by cell T[2,2] (another crop type in a different country). In Bayesian terms, a likelihood ratio less than 1 suggests that observing the conditions in cell T[1,1] is comparatively less probable than observing those in T[2,2]. Therefore, the data shows that the scenario in T[2,2] has a higher relative likelihood than in T[1,1], meaning that the specific crop-country association in T[2,2] is more likely than the one in T[1,1] given the current table structure. This can be useful in assessing which crop types are more prevalent or successful in certain countries based on observed data patterns.
