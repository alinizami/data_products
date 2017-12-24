#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Child Height Predictor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("infather",
                   "Father Height:",
                   min = 62,
                   max = 79,
                   value = 65),
       sliderInput("inmother",
                   "Mother's Height:",
                   min = 58,
                   max = 71,
                   value = 60),
       numericInput("inChildren",
                   "total number of children:",
                   min = 1,
                   max = 15,
                   value = 1),
       sliderInput("inChildnum",
                    "Child Number you want to predict:",
                    min = 1,
                    max = 15,
                    value = 1),
       selectInput("ingender",
                    "Gender:",
                   c("male", "female"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tags$p("This Application predicts the child's height based on it's parents information. 
      Please use the input boxes on the left to enter your information. You will have to enter the following:"
      ,br(),"1-Father's Height", tags$br(),
         "2- Mother's height, total number of children",br(),
         "3- total number of children- This is an important variable as well since the heights of the same parents vary across multiple children"
          ,br(),"4- Child Number you want to predict: This is valid in case a family has more than one child.
                  It asks you if you want to predict your 1st child,2nd child 3rd etc"     
      ),
      
      h3("Predicted Height for Child number " ,textOutput("text1", inline = TRUE),"is: ",br(),
       textOutput("pred1",inline = TRUE))
     
    )
  )
))
