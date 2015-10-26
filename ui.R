library(shiny)
# Define UI for slider demo application
shinyUI(fluidPage(
  
  #  Application title
  titlePanel("Fuel Consumption Prediction Application"),
  br(),
  
  # Sidebar Layout with radio buttons and sliders for input
  sidebarLayout(
    sidebarPanel(id = "sideBarPanelId",
      radioButtons('am', "Transmission Type:", c("Manual" = 0, "Automatic" = 1)),
      br(),
      br(),
# Slider Input for Weight. Used: min(data$wt), max(data$wt) and mean(data$wt) to choose parameters.
      sliderInput('wt', "Weight (lbs/1000):", min = 1.5, max = 5.5, value = 3, step = 0.25),
      br(),
      br(),
# Slider Input for qsec. Used: min(data$qsec), max(data$qsec) and mean(data$qsec) to choose parameters.
      sliderInput('qsec', "Quarter Mile Time (seconds): ", min = 14.5, max = 23, value = 17.5, step = 0.5)
    ), # End sidebarPanel
    
# Create Main Panel Tabset Panels
    mainPanel(
      tabsetPanel( id = "inTabset",
        tabPanel(id = "panel1", "MPG Prediction",
                 h4("Transmission Type (0 = Manual, 1 = Automatic): "),
                 verbatimTextOutput("amId"),
                 h4("Weight (lbs/1000): "),
                 verbatimTextOutput("wtId"),
                 h4("Quarter Mile Time (seconds): "),
                 verbatimTextOutput("qsecId"),
                 h4("Predicted Miles per Gallon (MPG): "),
                 verbatimTextOutput("predId")
                ),
        tabPanel(id = "panel2","How To",
                 h3("How To Use This Application"),
                 HTML(
                   "<ul>
                   <li>Select Transmission Type (Manual or Automatic) <i>- default = Manual</i></li>
                   <li>Select Weight using slider <i>- default = 3</i></li>
                   <li>Select Quarter Mile Time using slider <i>- default = 17.5</i></li>
                   <li>View MPG Prediction in \"MPG Prediction\" Tab</li>
                   </ul>"
                    )
                 ),
        tabPanel(id = "panel3","About This App", 
                 h3("About This Application"),
                 h4("This App implements a linear model to predict MPG for inputs:"),
                 HTML(
                   "<ul>
                     <li>am - Transmission Type (0 = Manual, 1 = Automatic)</li>
                     <li>wt - Weight (lbs/1000)</li>
                     <li>qsec - Quarter Mile Time (seconds)</li>
                   </ul>"
                 ),
                 br(),
                 h4("Prediction Model"),
                 h5("  mpg = 9.6178 + (-3.9165 * wt) + (1.2259 * qsec) + (2.9358 * am)"),
                 br(),
                 h4("Prediction Model Explained"),
                 # Using HTML to demonstrate Ordered List.
                 HTML(
                   "<ol>
                     <li>Prediction model was developed using the R library(datasets) mtcars data.</li>
                     <li>The mtcars dataset was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).</li>
                     <li>Analysis produced a model which uses an intercept and 3 variables that explain 85% of the variability in data.
                     <li>\"Weight\" and \"Quarter Mile Time\" variable slider ranges were selected by determining minimum and maximum values from the dataset. Default slider values were selected using mean values.</li>
                   </ol>"
                 )
               )
        
       
            ) # End tabsetPanel
        ) # End mainPanel
  ) # End sidebarLayout
) # End fluidPage

) # End shinyUI

