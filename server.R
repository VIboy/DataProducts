library(shiny)
library(UsingR)
library(ggplot2)

data(diamond)

shinyserver = function(input, output) {
    
    observeEvent(input$analysis, {
        
        fit=lm(price ~ carat, data = diamond)
        
        output$plot <- renderPlot ({
            plot(price ~ carat, data = diamond)
            abline(fit, col = "blue")
        })
        output$modelSummary <- renderPrint({
            summary(fit)
            
            })
        output$table <- renderDataTable(diamond)
         })
}


