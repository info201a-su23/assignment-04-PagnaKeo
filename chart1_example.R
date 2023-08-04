x_values <- seq(1, 3)
y_values <- seq(1,3)

library(ggplot2)
ggplot() +
  geom_line(aes(x=x_values, y = y_values))

url <- "https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv"
data <- read.csv(url)



black_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_black_prison_pop = sum(black_prison_pop_rate, na.rm = TRUE))

trend_graph <- ggplot(black_prison_pop_by_year, aes(x = year, y = total_black_prison_pop)) +
  geom_line() +
  geom_point() +
  labs(title = "Trend of Black Prison Population Over the Years",
       x = "Year", y = "Total Black Prison Population") +
  theme_minimal()

print(trend_graph)



white_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_white_prison_pop = sum(white_prison_pop_rate, na.rm = TRUE))

trend_graph_white <- ggplot(white_prison_pop_by_year, aes(x = year, y = total_white_prison_pop)) +
  geom_line() +
  geom_point() +
  labs(title = "Trend of White Prison Population Over the Years",
       x = "Year", y = "Total White Prison Population") +
  theme_minimal()

print(trend_graph_white)



latinx_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_latinx_prison_pop = sum(latinx_prison_pop_rate, na.rm = TRUE))

trend_graph_latinx <- ggplot(latinx_prison_pop_by_year, aes(x = year, y = total_latinx_prison_pop)) +
  geom_line() +
  geom_point() +
  labs(title = "Trend of Latinx Prison Population Over the Years",
       x = "Year", y = "Total Latinx Prison Population") +
  theme_minimal()

print(trend_graph_latinx)


native_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_native_prison_pop = sum(native_prison_pop_rate, na.rm = TRUE))

trend_graph_native <- ggplot(native_prison_pop_by_year, aes(x = year, y = total_native_prison_pop)) +
  geom_line() +
  geom_point() +
  labs(title = "Trend of Native Prison Population Over the Years",
       x = "Year", y = "Total Native Prison Population") +
  theme_minimal()

print(trend_graph_native)

library(ggplot2)
library(dplyr)
library(tidyr)

url <- "https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates-1990-WA.csv"
data <- read.csv(url)

black_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_black_prison_pop = sum(black_prison_pop_rate, na.rm = TRUE))

white_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_white_prison_pop = sum(white_prison_pop_rate, na.rm = TRUE))

latinx_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_latinx_prison_pop = sum(latinx_prison_pop_rate, na.rm = TRUE))

native_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_native_prison_pop = sum(native_prison_pop_rate, na.rm = TRUE))

aapi_prison_pop_by_year <- data %>%
  group_by(year) %>%
  summarise(total_aapi_prison_pop = sum(aapi_prison_pop_rate, na.rm = TRUE))

all_prison_pops <- bind_cols(
  black = black_prison_pop_by_year$total_black_prison_pop,
  white = white_prison_pop_by_year$total_white_prison_pop,
  latinx = latinx_prison_pop_by_year$total_latinx_prison_pop,
  native = native_prison_pop_by_year$total_native_prison_pop,
  aapi = aapi_prison_pop_by_year$total_aapi_prison_pop,
  year = black_prison_pop_by_year$year
)

all_prison_pops_long <- all_prison_pops %>%
  pivot_longer(cols = -year, names_to = "ethnicity", values_to = "total_prison_pop")

trend_graph_all <- ggplot(all_prison_pops_long, aes(x = year, y = total_prison_pop, color = ethnicity)) +
  geom_line() +
  geom_point() +
  labs(title = "Trends of Prison Population Over the Years by Ethnicity",
       x = "Year", y = "Total Prison Population") +
  theme_minimal()

print(trend_graph_all)








