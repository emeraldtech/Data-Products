
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

predictMPG <- function(wt, qsec, am) {
  amNum <- as.integer(am)
  mpg <- 9.6178 + (-3.9165 * wt) + (1.2259 * qsec) + (2.9358 * amNum)
  return(mpg)
}

shinyServer(
  function(input, output, session) {
    output$amId <- renderText(input$am)
    output$wtId <- renderText(input$wt)
    output$qsecId <- renderText(input$qsec)
    output$predId <- renderText(predictMPG(input$wt, input$qsec, input$am))
#     observe({
#     #  if (identical(input$sideBarPanelId, "panel2") || identical(input$"sideBarPanelId", "panel3"))
#        updateTabsetPanel(session, "sideBarPanelId", selected = "panel1")
#       })
  }
)


