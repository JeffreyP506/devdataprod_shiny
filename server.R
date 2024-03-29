library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since
# this doesn't rely on any user inputs we can do this once at
# startup and then use the value throughout the lifetime of the
# application
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))


# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("mpg ~", paste(input$variable, collapse = " + "))
  })
   
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a coefficients summary of the requested variable against mpg
  output$summary <- renderPrint({
    summary(lm(as.formula(formulaText()), 
            data = mpgData))$coef
  })
})
