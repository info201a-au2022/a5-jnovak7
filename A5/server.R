#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$interactive_co2_scatterplot <- renderPlotly({

      co2_scatterplot <- ggplot(co2_by_country, aes(x=population, y=co2))+ 
        geom_point(color="blue")+
        geom_text(label=co2_by_country$country)
    })
    
    output$co2_by_factor_interactive <- renderPlotly({
      
     
      co2_by_factor <- ggplot(co2_over_time, aes(year))+
        geom_line(aes(y = coal_co2, colour = "Coal"))+
        geom_line(aes(y = consumption_co2, colour = "Consumption"))+
        geom_line(aes(y = total_co2, colour = "Total"))+
        geom_line(aes(y = cement_co2, colour = "Cement"))
    })
      
    

}




