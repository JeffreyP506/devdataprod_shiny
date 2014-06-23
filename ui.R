library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles Per Gallon Linear Regression"),
  
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("variable", "Variable:",
                   c("Cylinders[cyl]" = "cyl",
                    "Displacement (cu.in.)[disp]" = "disp",
                    "Gross horsepower[hp]" = "hp",
                    "Rear axle ratio[drat]" = "drat",
                    "Weight (lb/1000)[wt]" = "wt",
                    "1/4 mile time[qsec]" = "qsec",
                    "V/S" = "vs",
                    "Transmission[am]" = "am",
                    "Number of forward gears[gear]" = "gear",
                    "Number of carburetors[carb]" = "carb"),
                   selected = "am")
    ),
    
	 # Show the caption and plot of the requested variable against
	 # mpg
    mainPanel(
      h3(textOutput("caption")),
      verbatimTextOutput("summary")
    )
  )
))
