# data101_emission_analysis

Areas Associated With Growing Vegetables Release Over 10,000 Metric Tons of CO2 Emissions Per Year – Is Agriculture DESTROYING Our Planet?

As climate change continues to pose significant challenges to global agriculture, and vice versa, understanding the interactions between various environmental factors and crop performance is essential. The dataset I was inspecting focuses on global agriculture, with data about the general environment of the crops as well as their environmental and industrial impacts, with variables including CO2 emissions, crop yield per hectare, total precipitation, and economic effects in millions of USD. I created a mosaic plot to illustrate the relationship between countries and crop types, ensuring easier identification of any derived trends regarding international activity. 
At first glance, the data within the file indicates that certain agricultural regions are associated with higher or lower amounts of carbon emissions based on the crop they are growing. Interestingly, vegetables showed the highest frequency among crops with elevated emissions.

However, although all these crops have varying levels of total emissions, some more than others, the difference between all the values is not statistically significant. This fact becomes evident when ordering crops by emission amounts and then visualizing the data within a box plot. All the crops fall within a similar range of 10-20 metric tons of associated emissions. Therefore, although the two variables are collected and displayed within the data set, they are not necessarily directly related, mainly as a region's carbon emissions also depend on variables such as pesticides, fertilizers, cattle, and human activity. Therefore, this "pattern" is disproved, and I wanted to highlight this as it is easy to look at data and assume a correlation/causation without conducting a thorough analysis. 

While exploring the relationship between extreme weather events, rainfall, and crop yield, the data revealed a notable correlation. A median-based approach helped filter for high rainfall and crop yield instances, resulting in 2,532 occurrences where both conditions were met. Further analysis revealed that 1,174 cases also experienced significant extreme weather events among these high-yield crops. This indicates a strong relationship between high precipitation, increased crop yield, and the frequency of extreme weather—critical information for predicting agricultural resilience under climate change.

I examined the economic implications of high-yield crops as well. Using the economic impact data within the file, I categorized the high-yield crops I found earlier into low, medium, and high impact based on their economic contributions. Notably, the majority of these high-yield crops fell into the "High" impact category, emphasizing a correlation. 
A scatter plot comparing crop yield against economic impact clearly reinforced this trend, showing that as crop yield increased, so did the economic impact, demonstrating the importance of maximizing crop yields. 

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



