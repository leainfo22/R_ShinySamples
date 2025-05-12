####################################
# Data Professor                   #
# http://github.com/dataprofessor  #
####################################

## It code was taken from the Git shown previusly and modify as example.

library(shiny)
data(airquality)

ui <- fluidPage(
  
  titlePanel("Ozone level!"),  
  sidebarLayout(    
    sidebarPanel(      
      # Input: Slider for the number of bins / bars ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    mainPanel(      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) { 

  output$distPlot <- renderPlot({
    
    x    <- airquality$Ozone
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
 #Histogram features   
    hist(x, breaks = bins, col = "#75AADB", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
    
  })
  
}
shinyApp(ui = ui, server = server)