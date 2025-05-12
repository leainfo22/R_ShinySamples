####################################
# Data Professor                   #
# http://github.com/dataprofessor  #
####################################

## It code was taken from the Git shown previusly and modify as example.

# Load R packages
library(shiny)
library(shinythemes)

  # Define UI - Shiny has many and "cerulean" is just one of them.
  # ui - user interface that gonna contain the 
  ui <- fluidPage(theme = shinytheme("cerulean"), 
    navbarPage(
      "Sample number 1", #
      tabPanel("Navigation bar 1",
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("txt1", "Given Name:", ""),
                 textInput("txt2", "Surname:", ""),
                 
               ), # sidebarPanel
               mainPanel(
                            h1("Header 1"),
                            
                            h4("Output 1"),
                            verbatimTextOutput("txtout"),

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navigation bar 2", "This panel is intentionally left blank as an example"),
      tabPanel("Navigation bar 3", "This panel is intentionally left blank as an example")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function that just it will show the 2 inputs concatenated and separeted by a space
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
  } # server
 
  # Create Shiny object
  shinyApp(ui = ui, server = server)