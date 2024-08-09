box::use(
  shiny[moduleServer, NS, fluidRow, icon, tags, includeHTML, h1, h2, h3],
  fullPage[pagePiling, pageSectionImage, pageSection],
  typedjs[typedOutput, renderTyped, typed]
)


#' @export
ui <- function(id) {
  ns <- NS(id)

  pagePiling(
    sections.color = c('#2f2f2f', '#2f2f2f', '#f9f7f1', '#2f2f2f'),
    menu = c(
      "Home" = "home",
      # "Map" = "map",
      # "Series" = "ts",
      "About" = "about",
      "Section1" = "section1"
    ),
    pageSectionImage(
      center = TRUE,
      img = "static/img/coding.jpg",
      menu = "home",
      h1(
        class = "header shadow-dark",
        typedOutput(outputId = ns("title"))
      ),
      h3(
        class = "light footer",
        "by", tags$a("Bartosz Stadnik", href = "https://www.linkedin.com/in/bartosz-stadnik-2084a2168/", class = "link")
      )
    ),
    pageSection(
      center = TRUE,
      menu = "about",
      h1("About", class = "header shadow-dark"),
      h2(
        class = "light",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      ),
      includeHTML("app/static/html/about.html")
    ),
    pageSection(
      center = TRUE,
      menu = "section1",
      includeHTML("app/static/html/main.html")
    )
  )

}


#' @export
server <- function(id) {

  moduleServer(id, function(input, output, session) {

    output$title <- renderTyped(
      typed(
        strings = c(
          "Bartosz Stadnik",
          "Where Ideas Become Reality..."
        ),
        typeSpeed = 45,
        smartBackspace = TRUE
      )
    )

  })

}





