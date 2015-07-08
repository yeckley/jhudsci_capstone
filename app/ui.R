library(shiny)

shinyUI(fluidPage(titlePanel("Word Prediction"),
                  sidebarLayout(position="left",
                  sidebarPanel(textInput("inputString",
                                         label="give me something to go on:"),
                               submitButton("Let me guess")),
                  mainPanel(textOutput("echo")))))