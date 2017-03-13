
library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Ecological Metadata Language (EML) Shiny Reader"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
      sidebarPanel(
        div("Upload your own EML files below"),
        fileInput('input_eml', 'Choose EML File',
                  accept = c('text/xml', 'application/xml')
                  ),

        tags$hr(),
        textOutput("error_text")
      ),

    # Show a plot of the generated distribution
    mainPanel(
      span("Title:"), textOutput("title_text")
    )
  )
))
