
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(EML)

sample_eml = read_eml("www/data/salmon_escapement_AYK.xml")

shinyServer(function(input, output) {


    output$title_text <- renderText({
        input_eml = input$input_eml


        if (is.null(input_eml)) {
            eml_title = sample_eml@dataset@title[[1]]@.Data
        } else {
            other_eml = read_eml(input_eml$datapath)

            if (eml_validate(other_eml)) {
                eml_title = other_eml@dataset@title[[1]]@.Data
            } else {
                eml_title = "Error invalid EML"
            }
        }

        eml_title})

    output$abstract_text <- renderText({
        input_eml = input$input_eml


        if (is.null(input_eml)) {
            eml_abstract = XML::xmlValue(sample_eml@dataset@abstract@para@.Data[[1]]@.Data[[1]])
        } else {
            other_eml = read_eml(input_eml$datapath)

            if (eml_validate(other_eml)) {
                eml_abstract = XML::xmlValue(other_eml@dataset@abstract@para@.Data[[1]]@.Data[[1]])
            } else {
                eml_abstract = "Error invalid EML"
            }
        }

        return(eml_abstract)
    })

})
