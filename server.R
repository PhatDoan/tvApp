
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


sizeToDistance <- function(size, type = 3, unit = "m") {
  # Calculate distance based on TV size, resolution, and unit
  # Out put to spelled-out distance, e.g.: "2.1 meter" or "5 feet 3 inches"
  
  coef <- c(0.1088, 0.0591, 0.0427, 0.02893) # Coefficient vector
  
  if (!(as.numeric(type) %in% 1:4)) stop("Type should be one in [1:4]")
  viewDist <- size * coef[type]
  
  
  if (unit == "i") {
    # Converting to imperial system
    feet <- floor(viewDist*3.28084)
    inches <- round((viewDist*3.28084 - feet)*12, 0)
    if (inches == 0) dist <- paste(feet, "feet")  
      else dist <- paste(feet, "feet", inches, "inches")  
    
  } 
  
  else {
    dist <- paste(round(viewDist, 1), " meters")  
  }
  
  return(dist)
}

shinyServer(function(input, output) {
  
  output$optimal <- renderText({
    paste(sizeToDistance(input$size, as.numeric(input$type), input$unit))
            
  })
      
  output$furthest <- renderText({
    if (!(input$type == 1)) paste(sizeToDistance(input$size, as.numeric(input$type) - 1, input$unit))
      else paste("Not available")
        
  })
})  
