library(shiny)


shinyUI(

  fluidPage(
    tags$head(
      tags$style(HTML("
                      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                      
                      h1 {
                      font-family: 'Lobster', cursive;
                      font-weight: 500;
                      line-height: 1.1;
                      color: #4d3a7d;
                      }
                      
                      "))
      ),
    titlePanel("Usage of utilities utilization"),
    headerPanel("Selection Box"),

    sidebarLayout(

   
      sidebarPanel(
        selectInput("energy", "Type of utility consumed:",
                    choices=c("Gas", "Electricity", "Water")),
        selectInput("year", "Year:",
                    choices=c("2013", "2014", "2015")),
        hr(),
        helpText("Data of my family utilities utilization.", br(),
                 "Select the type of utility and the year to generate the graph.")),


      mainPanel(
        plotOutput("plot1")))))
