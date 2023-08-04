

install.packages("ggplot2")
install.packages("maps")

library(ggplot2)
library(maps)
us_map <- map_data("state")
ggplot(data = us_map, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "lightblue", color = "white") +
  coord_fixed(1.3) +
  theme_void()


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
library(maps)
library(stringr)
library(dplyr)

data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv")

average_black_prison_pop <- data %>%
  group_by(county_name) %>%
  summarise(average_black_prison_pop_county = mean(black_prison_pop_rate, na.rm = TRUE))

wa_county_map <- map_data("county", region = "washington")

county_data <- data.frame(
  county = unique(wa_county_map$subregion),
  value = data$black_prison_pop_rate,
  avg_black_pop = average_black_prison_pop$average_black_prison_pop_county)

combined_data <- merge(wa_county_map, county_data, by.x = "subregion", by.y = "county")

county_centers <- combined_data %>%
  group_by(subregion) %>%
  summarise(center_long = mean(range(long)), center_lat = mean(range(lat)))

heatmap2 <- ggplot() +
  geom_polygon(data = combined_data, aes(x = long, y = lat, group = group, fill = avg_black_pop), color = "black") +
  geom_text(data = county_centers, aes(x = center_long, y = center_lat, label = str_to_title(subregion)),
            hjust = 0.5, vjust = 0.5, size = 2, color = "black") +
  scale_fill_gradient(low = "white", high = "darkblue", name = "Average Black Prison Population Rate") +
  labs(title = "Heat Map of Washington State Counties", fill = "Average Black Prison Population Rate") +
  theme_void() +
  coord_fixed(ratio = 1.3)

print(heatmap2)










