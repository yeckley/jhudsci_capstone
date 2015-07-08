library(shiny)
library(tm)
conditionInput <- function(s, ...) {

    s <- tolower(s)
    s <- removeNumbers(s)
    s <- removePunctuation(s)
    s <- stemDocument(s)
    s <- stripWhitespace(s)
    s
}
shinyServer(function(input,output) {
    output$echo <- renderText({conditionInput(input$inputString)})
} )