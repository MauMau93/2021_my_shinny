#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("This is a new Shiny app"),
    includeMarkdown("Untitled.Rmd"),
    h3("Plots"),
    plotOutput(outputId = "plot")
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$plot <- renderPlot({
        ggplot(msleep, aes(bodywt, sleep_total, colour = vore)) +
            scale_x_log10() +
            geom_point() + facet_wrap(~ vore, nrow = 2)
    })
   
}

# Run the application 
shinyApp(ui = ui, server = server)
