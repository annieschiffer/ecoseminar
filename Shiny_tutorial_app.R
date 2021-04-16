#R Shiny Tutorial

#Attach necessary packages
library(tidyverse)
library(shiny)
library(shinythemes)

# Attach necessary packages
library(tidyverse)
library(shiny)
library(shinythemes)

#Importing data set
spooky<-read_csv("spooky_data.csv")

# Create the user interface (create what the user sees and interacts with):
ui <- fluidPage(
  titlePanel("Spooky data"),
  sidebarLayout(
    sidebarPanel("my widgets",
    selectInput(inputId = "state_select", # one widget with dropbar selection
                label = "Choose a state",
                choices = unique(spooky$state)
                ),
    radioButtons(inputId = "region_select", # another widget with button selection
                 label = "Choose region:",
                 choices = unique(spooky$region_us_census)) 
    ),
    mainPanel("my outputs", # connected server back to user interface
    p("State's top candies:"),
    tableOutput(outputId = "candy_table"),
    p("Region's top costumes:"),
    plotOutput(outputId = "costume_graph")
  )
  )
)


# Create the server function (builds outputs based on what the user inputs):
server <- function(input, output) {
  state_candy <- reactive({ # reaction to user input for state selection
    spooky %>%
      filter(state == input$state_select) %>%
      select(candy, pounds_candy_sold)
  })
  output$candy_table <- renderTable({ # output format for candy rankings
    state_candy()
  })
  
  region_costume<- reactive({ # reaction to user input for region selection
    spooky %>%
      filter(region_us_census == input$region_select) %>%
      count(costume, rank)
  })
  
  output$costume_graph<- renderPlot({ # output format for costume rankings
    ggplot(region_costume(), aes(x = costume, y = n)) +
      geom_col(aes(fill = rank)) +
      coord_flip() +
      scale_fill_manual(values = c("black","purple","orange")) +
      theme_minimal()
  })
}

# Combine them into an app:
shinyApp(ui = ui, server = server)

#Create a widget (collect information from the user that will produce outputs):

#dropdown selection
#checklist
#slider bar
