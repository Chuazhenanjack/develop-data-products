library(shiny)

data <- read.csv("utilization.csv", sep=",", header=T)
colnames(data)[4] <- "Gas"
colnames(data)[7] <- "Electricity"
colnames(data)[10] <- "Water"


shinyServer(function(input, output) {

  dataInput <- reactive({
    subset(data, select=c(input$energy), subset=(substring(data$Date,1,4) == input$year))
  })

  
  output$plot1 <- renderPlot({

    
    barplot(dataInput()[,input$energy],
            main=paste(input$energy, "in", input$year),
            ylab="Utilization", ylim=c(0,80),
            xlab="Weeks")
  })
})
