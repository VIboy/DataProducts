library(shiny)
data(diamond)
library(ggplot2)


shinyUI = fluidPage(
    
    title = "Linear Regression of diamond prices",
    h1("Linear Regression of diamond prices"),
    
    sidebarLayout(
        mainPanel(
            p('This is an application showing how to use simple linear regression 
               on a diamond dataset in order to obtain the coefficients of a formula for
               predicting the price of diamond based on its mass/weight. The data set used 
               consists of the price of diamond in Singapore dollars and the mass/weight in carats 
               which is standard measure of diamond mass. There are altogether 48 observations
              of the 2 variables, price and carat.'
            ),
            h2("Dataset of diamond prices(S$) vs weight(carat)."), 
        dataTableOutput("table"),
        p('You can store the diamond dataset from library(UsingR) into your
          working directory with the code "write.csv(diamond, "diamond.csv")
          for the purposes of this application.'),
        br(),
        title = "Instructions on how to use this application",
        h2("Instructions on how to use this application"),
        br(),
        p('In order to use this application, you will have to choose 
          and download the "diamond" dataset file from your working directory,
          and input the response variable "price" and predictor variable
          "carat" in the input widgets.'),
        p('After you have clicked the "Analyze" button, you will be able to
          see the values of the dataset, the results of the linear regression
          as well as the plot.'),
        br(),
        p('Based on the results of the linear regression, the formula
          for predicting the price of diamond is:'),
        br(),
        p('price = -259.6 + 3721 * weight(in carats).'),
        br(),
        p('The plot on the right shows the linear relationship between the price
          and weight of diamond in the dataset.')
        ),
        
        
        sidebarPanel(
        
            h2("Your Data"),
                                       
            fileInput("mydata", label = h4("Please upload the .xls, .txt, or .csv file you would like included in the analysis.")),
                                       
            radioButtons("filetype", label = h4("Please select the type of data uploaded:"), c(".csv", ".txt", ".xls"), selected = ".xls"),
                                       
                textInput("response", label=h4 ("What is the column name of your response variable?")),
                                       
                textInput("explan1", label=h4 ("What is the column name of your explanatory variable?")),
                actionButton("analysis","Analyze!"),
           
           verbatimTextOutput("modelSummary"),
            plotOutput("plot")
       
        )
    )
)
                                       
