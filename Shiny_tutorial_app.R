#R Shiny Tutorial

#Attach necessary packages
library(tidyverse)
library(shiny)
library(shinythemes)

# Attach necessary packages
library(tidyverse)
library(shiny)
library(shinythemes)

# Create the user interface (create what the user sees and interacts with):
ui <- fluidPage()

# Create the server function (builds outputs based on what the user inputs):
server <- function(input, output) {}

# Combine them into an app:
shinyApp(ui = ui, server = server)

#Create a widget (collect information from the user that will produce outputs):

#dropdown selection
#checklist
#slider bar

