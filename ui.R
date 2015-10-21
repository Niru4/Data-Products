library(shiny)
library(datasets)
library(dplyr)
data("DNase")
shinyUI(pageWithSidebar(
  headerPanel('ELISA assay data for rat serum'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(DNase)),
    selectInput('ycol', 'Y Variable', names(DNase),
                selected=names(DNase)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 6)
  ),
  mainPanel(
    plotOutput('plot1')
  )
))