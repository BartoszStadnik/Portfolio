box::use(
  fullPage[fullSlideImage, pagePiling, pageSection, pageSectionImage],
  shiny[div, h1, h2, h3, includeHTML, img, moduleServer, NS, tags],
  typedjs[renderTyped, typed, typedOutput],
)

box::use(
  app/view/resume
)

#' @export
ui <- function(id) {
  ns <- NS(id)

  pagePiling(
    sections.color = c("#2f2f2f", "#2f2f2f", "#1f1e1e"),
    menu = c(
      "Home" = "home",
      "About" = "about",
      "CV" = "cv"
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
        "by",
        tags$a(
          "Bartosz Stadnik",
          href = "https://www.linkedin.com/in/bartosz-stadnik-2084a2168/",
          class = "link"
        )
      )
    ),
    pageSection(
      center = TRUE,
      menu = "about",
      h1("About", class = "header shadow-dark"),
      div(
        style = "margin-left: 20px; margin-right: 20px; text-align: justify;",
        h3(
          class = "light",
          "I am a seasoned developer with nearly 6 years of experience in the insurance industry, 
          transitioning from an analyst role to a developer. 
          For the past 5 years, I've specialized in R, 
          focusing on building Shiny applications that drive business decisions. Recently, 
          I've expanded my role to include 
          supporting architecture and process management around Shiny. 
          My goal is to create innovative, efficient solutions that not only meet current needs 
          but also pave the way for future advancements."
        )
      ),
      includeHTML("app/static/html/about.html")
    ),
    pageSection(
      center = TRUE,
      menu = "cv",
      resume$ui(ns("cv"))
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

    resume$server("cv")

  })

}
