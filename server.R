library(datasets)
library(dplyr)
data("DNase")
dplyr::select(DNase, conc, density)
shinyServer(function(input, output) {
  
  selectedData <- reactive({
    DNase [, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(3, 2, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 5, cex = 4, lwd = 4)
  })
  
})

