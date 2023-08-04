url<-"https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv"
data <- read.csv(url)
View(data)


num_rows <- nrow(data)
print(num_rows)

num_columns <- ncol(data)
print(num_columns)
#Which county has the lowest and highest  number total prison population rate

library(dplyr)
url<-"https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv"
data <- read.csv(url)
average_total_prison_pop <- data %>%
  group_by(county_name) %>%
  summarise(average_total_prison_pop = mean(total_prison_pop_rate, na.rm = TRUE)) %>%
  arrange(average_total_prison_pop)

print(average_total_prison_pop)



#what is the avaerage black prison population for each county?

average_black_prison_pop <- data %>%
  group_by(county_name) %>%
  summarise(average_black_prison_pop_county = mean(black_prison_pop_rate, na.rm = TRUE))
print(average_black_prison_pop)

#what is the average white prison population for each county?

average_white_population <- data %>%
  group_by(county_name) %>%
  summarise(average_white_prison_pop = mean(white_prison_pop_rate, na.rm = TRUE))
print(average_white_population)
#what is the average latin prison population for each county?

  average_latinx_population <- data %>%
  group_by(county_name) %>%
  summarise(average_latinx_prison_pop = mean(latinx_prison_pop_rate, na.rm = TRUE))
print(average_latinx_population)
  
#what is the avaerage native prison population for each county?
average_native_population <- data %>%
  group_by(county_name) %>%
  summarise(average_native_prison_pop = mean(native_prison_pop_rate, na.rm = TRUE))
print(average_native_population)

#what is the average aapi prison population for each county?

average_aapi_population <- data %>%
  group_by(county_name) %>%
  summarise(average_aapi_prison_pop = mean(aapi_prison_pop_rate, na.rm = TRUE))
print(average_aapi_population)




library(ggplot2)
library(maps)
library(stringr)  

county_map <- map_data("county", region = "washington")

county_centers <- county_map %>%
  group_by(subregion) %>%
  summarise(center_long = mean(range(long)), center_lat = mean(range(lat)))

county_centers$subregion <- str_to_title(county_centers$subregion)

county_map_plot <- ggplot() +
  geom_polygon(data = county_map, aes(x = long, y = lat, group = group), 
               fill = NA, color = "white") +
  geom_polygon(data = county_map, aes(x = long, y = lat, group = group), 
               fill = NA, color = "black") +
  geom_text(data = county_centers, aes(x = center_long, y = center_lat, label = subregion), 
            hjust = 0.5, vjust = 0.5, size = 2, color = "black") +
  coord_fixed(ratio = 1.3) +
  theme_void()
print(county_map_plot)



library(ggplot2)
library(dplyr)
library(tidyr)

average_black_prison_pop <- data %>%
  group_by(county_name) %>%
  summarise(average_black_prison_pop_county = mean(black_prison_pop_rate, na.rm = TRUE))

average_white_population <- data %>%
  group_by(county_name) %>%
  summarise(average_white_prison_pop = mean(white_prison_pop_rate, na.rm = TRUE))

average_latinx_population <- data %>%
  group_by(county_name) %>%
  summarise(average_latinx_prison_pop = mean(latinx_prison_pop_rate, na.rm = TRUE))

average_native_population <- data %>%
  group_by(county_name) %>%
  summarise(average_native_prison_pop = mean(native_prison_pop_rate, na.rm = TRUE))

average_aapi_population <- data %>%
  group_by(county_name) %>%
  summarise(average_aapi_prison_pop = mean(aapi_prison_pop_rate, na.rm = TRUE))

combined_data <- merge(average_black_prison_pop, average_white_population, by = "county_name")
combined_data <- merge(combined_data, average_latinx_population, by = "county_name")
combined_data <- merge(combined_data, average_native_population, by = "county_name")
combined_data <- merge(combined_data, average_aapi_population, by = "county_name")

combined_data_long <- combined_data %>%
  gather(variable, value, -county_name)

heatmap1 <- ggplot(combined_data_long, aes(x = county_name, y = variable, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "darkblue", name = "Population") +
  labs(title = "Prison Population Heatmap by Ethnicity in Washington",
       y = "Ethnicity") + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

print(heatmap1)









