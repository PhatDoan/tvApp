
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("TV Viewing Distance Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("size",
                  "TV Diagonal (Inches)",
                  min = 32,
                  max = 105,
                  value = 50),

      radioButtons("type", "Resolution of Content",
                   choices = list("480p" = 1, "720p" = 2, "1080p (Full HD)" = 3, "4K (Ultra HD)" = 4), 
                   selected = 3),
      
      radioButtons("unit", "Unit",
                   choices = list("Metric" = "m", "Imperial" = "i"), 
                   selected = "m"),
      h3("Recommended Distance"),
      strong("Optimal"),
      textOutput("optimal"),
      br(),
      strong("Farthest"),
      textOutput("furthest")
                  
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h3("How Far Should I Sit from The TV?"),
      p("It depends on the size of your TV as well as your personal preference. This app uses the recommendation from SMPTE, which says that, ideally, a screen should fill 30 degrees of your field of vision. This translates into a viewing distance of about 1.6 times the TV diagonal."),
      p("The resolution of the content you are watching also matters. More detailed content means more points to display and allows you to sit closer to the TV without seeing meaningless dots."),
      br(),
      h4("How To Use"),
      p("Select the diagonal of your TV with the slider. Then choose the resolution of the content you like to watch. Use the Unit select buttions to convert the output units if needed."),
      p(span("Optimal ", style = "color:brown"), "is the recommended distance for watching. Moving closer and you will start to notice pixelation."),
      p(span("Farthest ", style = "color:brown"), "is the farthest you should sit to enjoy the benefit of the resolution. If you sit further away, you can't tell the different between the current resolution with the next lower resolution level."),
      br(),
      h4("'Err On The Bigger Side'"),
      p("As said tech writer Geoffrey Morrison in ", a("his article on CNET", href = "http://www.cnet.com/news/how-big-a-tv-should-i-buy/"), ". If you find that the distance calculated here is a bit far or you just want a bigger TV, go for it and ", a("let me know your experience", href = "mailto:phat.dq@gmail.com?subject=About+TV+Viewing+Distance+App"), ".")
      
      
      
      
        )
    )
  )
)
