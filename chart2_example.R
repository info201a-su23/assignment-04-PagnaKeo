x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot() +
  geom_line(aes(x=x_values, y = y_values))


library(ggplot2)
library(dplyr)

combined_data <- merge(average_total_prison_pop, average_black_prison_pop, by = "county_name")
combined_data <- merge(combined_data, average_white_population, by = "county_name")
combined_data <- merge(combined_data, average_latinx_population, by = "county_name")
combined_data <- merge(combined_data, average_native_population, by = "county_name")
combined_data <- merge(combined_data, average_aapi_population, by = "county_name")

heatmap1 <- ggplot(combined_data, aes(x = county_name)) +
  geom_tile(aes(y = "Black", fill = average_black_prison_pop_county), position = "dodge") +
  geom_tile(aes(y = "White", fill = average_white_prison_pop), position = "dodge") +
  geom_tile(aes(y = "Latinx", fill = average_latinx_prison_pop), position = "dodge") +
  geom_tile(aes(y = "Native", fill = average_native_prison_pop), position = "dodge") +
  geom_tile(aes(y = "AAPI", fill = average_aapi_prison_pop), position = "dodge") +
  scale_fill_gradient(low = "white", high = "darkblue", name = "Population") +
  labs(title = "Prison Population Heatmap by Ethnicity in Washington Counties",
       y = "Ethnicity") + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

print(heatmap1)




library(ggplot2)
library(dplyr)

combined_data <- merge(average_total_prison_pop, average_black_prison_pop, by = "county_name")
combined_data <- merge(combined_data, average_white_population, by = "county_name")
combined_data <- merge(combined_data, average_latinx_population, by = "county_name")
combined_data <- merge(combined_data, average_native_population, by = "county_name")
combined_data <- merge(combined_data, average_aapi_population, by = "county_name")

heatmap <- ggplot(combined_data, aes(x = county_name)) +
  geom_tile(aes(y = "Black", fill = average_black_prison_pop_county), position = "dodge") +
  geom_tile(aes(y = "White", fill = average_white_prison_pop), position = "dodge") +
  geom_tile(aes(y = "Latinx", fill = average_latinx_prison_pop), position = "dodge") +
  geom_tile(aes(y = "Native", fill = average_native_prison_pop), position = "dodge") +
  geom_tile(aes(y = "AAPI", fill = average_aapi_prison_pop), position = "dodge") +
  scale_fill_gradient(low = "white", high = "darkblue", name = "Population") +
  labs(title = "Prison Population Heatmap by Ethnicity in Washington Counties",
       y = "Ethnicity") + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

print(heatmap)



library(ggplot2)
library(dplyr)

combined_data <- merge(average_total_prison_pop, average_black_prison_pop, by = "county_name")
combined_data <- merge(combined_data, average_white_population, by = "county_name")
combined_data <- merge(combined_data, average_latinx_population, by = "county_name")
combined_data <- merge(combined_data, average_native_population, by = "county_name")
combined_data <- merge(combined_data, average_aapi_population, by = "county_name")

heatmap <- ggplot(combined_data, aes(x = county_name)) +
  geom_tile(aes(y = "Black", fill = average_black_prison_pop_county), position = "dodge") +
  geom_tile(aes(y = "White", fill = average_white_prison_pop), position = "dodge") +
  geom_tile(aes(y = "Latinx", fill = average_latinx_prison_pop), position = "dodge") +
  geom_tile(aes(y = "Native", fill = average_native_prison_pop), position = "dodge") +
  geom_tile(aes(y = "AAPI", fill = average_aapi_prison_pop), position = "dodge") +
  scale_fill_gradient(low = "white", high = "darkblue", name = "Population") +
  labs(title = "Prison Population Heatmap by Ethnicity in Washington Counties",
       y = "Ethnicity") + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

print(heatmap)







