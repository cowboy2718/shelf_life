# Shell life calculators
# Developed by Tony Gojanovic
# May 14,2020
#
# Calculator uses inputs obtained from parameter estimates of regression formulations based on sensory evaluations of flavor impact
# over time including estimates of varation in flavor.
#setwd("/Users/tonygojanovic/data/Rprojects/shelf_life/")

ui <- fluidPage(
  # App title ----
  titlePanel("Shelf Life Calculator"),
  
  # Sidebar with slider inputs for the staling level
  sidebarLayout(
    sidebarPanel(
      sliderInput('stale', 'Desired flavor level', 2, min = 0, max = 10, step = 0.1),
      numericInput('stale_rate', 'Weekly flavor decay rate',0.052,min=0,max=1,step = 0.001),
      numericInput('intercept','Starting level (intercept term at week = 0)',0.696,min=0,max=1,step=0.001), 
      numericInput('variability', 'Flavor variability (std dev)', 0.192, min = 0, max = 1, step = 0.001),
      sliderInput('risk', 'Risk level for % out of compliance (one sided)', 0.02, min = 0.01, max = 0.5, step = 0.01),
      submitButton('Calculate')
    ),
    mainPanel(withMathJax(),
      # Output summary
      h3("Instructions"),
      p("The estimated shelf life is based on input parameters related to the acceptable level of flavor, estimated weekly flavor decay rate, 
        estimated flavor variability, and the desired risk level for out of code product.  The starting value or intercept is based on the estimated sensory flavor level at week 0."),
      p(""),
      p("The shelf life calculator is based on the follow linear model (a general model is only one type of model that may be applicable)."),
      p("$$ flavor level = intercept + (decay rate \\times week) + error $$"),
      p("Note: Estimates are based on parameters estimated through sensory testing and regression formulations of key flavor attributes as they 
        behave over time including sensory and product variation (normally distributed error terms are assumed)."),
      p(""),
      p("The calculator is only valid within the range of estimated parameters and caution should be used for extrapolation.  
        However, 'playing' with values at extreme values will also show how different parameters affect flavor stability."),
      p(""),
      h3("Your mean estimated shelf life (in weeks) is:"),
      verbatimTextOutput("weeks", placeholder = TRUE),
      h3("Best case shelf life (given the proportion of product that could be out of code:"),
      verbatimTextOutput("risk"),
      verbatimTextOutput("upper", placeholder = TRUE)
      
    )
  )
)

calculate_weeks <- function(stale,stale_rate,intercept,variability,risk) {
  return((stale-intercept)/stale_rate)
}  
calculate_upper <- function(stale,stale_rate,intercept,variability,risk) {
  return(((stale-intercept)/stale_rate)-abs(qnorm(risk))*(variability))
}  

# Define server logic to plot shelf life ----
server<-(
    function(input, output) {
    output$weeks <- renderPrint({calculate_weeks(input$stale, input$stale_rate, input$intercept,input$variability)})
    output$upper<-renderPrint({calculate_upper(input$stale, input$stale_rate, input$intercept,input$variability,input$risk)})
    output$risk<-renderPrint(input$risk)
    }
  )

shinyApp(ui,server)