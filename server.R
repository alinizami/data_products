#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
data("GaltonFamilies")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  model1<-lm(childHeight~ father+mother+children+childNum+gender, data = GaltonFamilies[,-1])
  
  model1pred <- reactive({
    fatherInput <- input$infather
    motherInput <- input$inmother
    childrenInput <- input$inChildren
    childnumInput <- input$inChildnum
    genderinput<-input$ingender
    ##predict(model1, newdata = data.frame(mpg = mpgInput))
    
    if (childnumInput>childrenInput) {
      " Your Child's number should be less than total Children"
    } else {
      predict(model1, newdata=data.frame(father=fatherInput, mother=motherInput,children=childrenInput,childNum=childnumInput,gender=genderinput))
      
    }
    
  })
  
 
  
  output$pred1 <- renderText({
    model1pred()
      })
  
  output$text1<- renderText({
    input$inChildnum
    
  })
    
  
  
  
})
