box::use(
    htmltools[tags],
    shiny
)

#' @export
ui <- function(id) {
    
    ns <- shiny$NS(id)

    shiny$div(
        #class = "main-text",
        shiny$h1(
            class = "header shadow-dark",

            "There is my CV:"
        ),
        # add download CV button
        shiny$downloadButton(
            outputId = ns("download_cv_button"), 
            label = "Download data",
            class = "download-cv-btn"
        ),

        # remove disabled attribute from download button
        tags$script(shiny$HTML("
            $(document).on('shiny:connected', function() {
            $('#app-cv-download_cv_button').removeClass('disabled').attr('aria-disabled', 'false');
            });
        ")),
    )

    

}

#' @export
server <- function(id) {

    shiny$moduleServer(id, function(input, output, session) {
        # server logic
        output$download_cv_button <- shiny$downloadHandler(
            filename = "Bartosz_Stadnik_CV.pdf",
            content = function(file) {
                file.copy("app/static/pdf/Bartosz_Stadnik_CV.pdf", file)
            }
        )
    })

    
    
    

}