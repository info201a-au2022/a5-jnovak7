#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(plotly)
library(shiny)
library(tidyr)
library(ggplot2)
library(dplyr)

           
ui <- fluidPage(theme = shinytheme("paper"),
                navbarPage("Analyzing Co2 Content By Country",
                           tabPanel("Introduction",
                                    titlePanel("Introduction",
                                      mainPanel(h1("Introduction"),
                                        
                                      )
                                    ),
                            
                             mainPanel(h4("The data set that I worked with for this product surrounded a number of metrics that portrayed different things that contributed to co2 emmission. The dataset grouped these metrics by country as well as region and a total world summary. 
                                          The first value that I wanted to highlight was total world c02 emmision in 2021. I choose this specifically because climate change is a world effort that can be helped by individual country efforts but at the end of the day worldy efforts are most important.
                                          The next values that I wanted to input that were easy to calculate yet super interesting to me was the U.S co2 emmision in 2021 and then what percentage of total world co2 did the U.S emmit. This can show us the United States contribution to climate change.
                                          The last two values that I crunched were the highest co2 emmision per capita and the country with the biggest increase in co2 emmisions. These help put co2 output into perspective based on the size and overall direction of the country.
                                          The countries at the top of these metrics should be the ones most scrutinized."),
                                       p(h2(world_co2)),
                                       h4("The amount of total co2 the world produced in 2021"),
                                       h2(US_vs_Worldco2),
                                       h4("Percentage of world co2 that the U.S created"),
                                       h2(country_most_co2),
                                       h2(country_most_co2_value),
                                       h4("Country with the highest co2/ capita (Qatar) and what that value is"),
                                       h2(country_highest_growth),
                                       h2(country_most_growth),
                                      
                                       h4("Country with the biggest increase in co2 emmision and what that percent increase was"),
          
                               
                             )
                           ),
                           tabPanel("Interactive Visualization 1",
                                    titlePanel("Visualization 1"),
                                           mainPanel("This is an interactive scatterplot that shows every country and how they rank in terms of co2 emmision and population",
                                             plotlyOutput("interactive_co2_scatterplot"
                                                          ),
                                             
                                           ),
                                      
                             
                           ),
                           tabPanel("Interactive Visualization 2",
                                    titlePanel("Visualization 2"),
                                    sidebarLayout(
                                      sidebarPanel(
                                        selectInput("select", label = h3("Select Co2 Factor"), 
                                                    choices = list("co2" , "cement_co2", "concrete_co2",
                                                                   "coal_co2" ), 
                                                    selected = "co2" ), 
                                      ),
                                    mainPanel("This interactive graph lets you select one of the main contributing factors of co2 emmision and it will output how that factor has been growing/ declining over time as well as overall co2 trend",
                                              plotlyOutput("co2_by_factor_interactive"
                                                         ),
                                              ),
                                    ),
                           )
                  
                )
)
                
                                   













