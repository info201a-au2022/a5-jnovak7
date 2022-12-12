co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
library("dplyr")

########### 
#value 1 Total world co2 created in 2021
world_co2 <- co2_data %>% 
  select(co2, year, country) %>% 
  filter(year == "2021", country == "World") %>% 
  pull(co2) 


 countries <- co2_data %>% 
   select(co2, year, country) %>% 
   filter(year == "2021")
  
 
 
#U.S co2
 
 US_co2 <- co2_data %>% 
   select(co2, year, country) %>% 
   filter(year == "2021", country == "United States") %>% 
   pull(co2)
 
 
#US percentage of world c02
 
US_vs_Worldco2 <- US_co2/world_co2

#value 2 country most co2/ capita in 2021
country_most_co2 <- co2_data %>% 
  select(co2_per_capita, country, year) %>% 
  filter(year == "2021") %>% 
  arrange(-co2_per_capita) %>%
  summarise(country_most_co2 = head(country, n =1L)) %>% 
  pull(country_most_co2)
  

country_most_co2_value <- co2_data %>% 
  select(co2_per_capita, country, year) %>% 
  filter(year == "2021") %>% 
  arrange(-co2_per_capita) %>%
  summarise(country_most_co2 = head(co2_per_capita, n =1L)) %>% 
  pull(country_most_co2)
  
?head

#value 3 country most co2/ GDP
country_highest_growth <- co2_data %>% 
  select(co2_growth_prct, country, year) %>% 
  filter(year == "2021") %>% 
  arrange(-co2_growth_prct) %>% 
  summarise(country_highest_growth = head(country, n =1L)) %>% 
  pull(country_highest_growth)

country_most_growth <- co2_data %>% 
  select(co2_growth_prct, country, year) %>% 
  filter(year == "2021") %>% 
  arrange(-co2_growth_prct) %>% 
  summarise(country_highest_growth = head(co2_growth_prct, n =1L)) %>% 
  pull(country_highest_growth)

######### Visualization page
#Visualization 1 (map?)



co2_by_country <- co2_data %>% 
  select(co2, country, year, population) %>% 
  filter(year == "2021", co2 < 5300)

library(ggplot2)

co2_scatterplot <- ggplot(co2_by_country, aes(x=population, y=co2))+ 
  geom_point(color="blue")+
  geom_text(label=co2_by_country$country)
  



library(plotly)

interactive_co2_scatterplot <- ggplotly(co2_scatterplot)

?mutate()


#Visualization 2 (widget)

co2_over_time <- co2_data %>% 
  select(year, coal_co2, consumption_co2, co2, cement_co2) %>% 
  group_by(year) %>% 
  summarise(coal_co2 = sum(coal_co2, na.rm = TRUE),
            consumption_co2 = sum(consumption_co2, na.rm = TRUE),
            total_co2 = sum(co2, na.rm = TRUE),
            cement_co2 = sum(cement_co2, na.rm = TRUE))
            

co2_by_factor <- ggplot(co2_over_time, aes(year))+
  geom_line(aes(y = coal_co2, colour = "Coal"))+
  geom_line(aes(y = consumption_co2, colour = "Consumption"))+
  geom_line(aes(y = co2, colour = "Total"))+
  geom_line(aes(y = concrete_co2, colour = "Concrete"))
              
  


co2_by_factor_interactive <- ggplotly(co2_by_factor)




