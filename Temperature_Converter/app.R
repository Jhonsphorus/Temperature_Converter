#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#library(rsconnect)
library(shiny)
#rsconnect::deployApp('C:/Users/usewr/Documents/RProject/Personal_Projects/Temp_Converter/Temperature_Converter')

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    
    #titlePanel("Phorus Temperature Converter"),
    tags$h2("Phorus Temperature Converter"),
    # Sidebar with a numeric and select input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId ="tempval", label = "Temperature",value =0),
            selectInput(inputId = "tempSelect1",label = "Input Unit", choices = c(" ","fahrenheit","celsius")),
            selectInput(inputId = "tempSelect2",label = "Selec Output Unit", choices = c(" ","fahrenheit","celsius") )
        ),
        # Show the value of the converted temperature
        mainPanel(
           verbatimTextOutput("tempOutput")
        )
    )
)

# Define server logic required to output the converted temperature
server <- function(input, output) {
    output$tempOutput <- renderText(
        
        if(input$tempSelect1==" " | input$tempSelect2==" " ){
            paste(" ")
            
        }else if(input$tempSelect1=="fahrenheit" & input$tempSelect2=="fahrenheit" ){
            paste(input$tempval, "fahrenheit")
            
        }else if(input$tempSelect1=="celsius" & input$tempSelect2=="celsius" ){
            paste(input$tempval, "celsius")
            
        }else if(input$tempSelect1=="celsius" & input$tempSelect2=="fahrenheit" ){
            temp = ((input$tempval*9)/5)+32
            paste(temp, "fahrenheit")
        }else {
            temp = ((input$tempval-32)*5)/9
            paste(temp,"celsius")
        }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
