#' \code{enable_attributes}
#'
#' This function allows you to access the attributes of an html element
#' as R objects. This may be useful if there are cases where you need an html
#' attribute is important for running specific code. A potential case is
#' rendering a dark and light chart depending on the CSS classes of an element.
#' However, if you are using an HTML/JavaScript based library, chart styling
#' should be done using CSS.
#'
#' This functions works by injecting an span element immediately after the
#' target element. Using a custom input binding, the function looks for the
#' parent element and restructures the html attributes into an object.
#'
#' This function takes no arguments. To access the attributes in the shiny
#' server, it is critical that the target element has an ID. Call the function
#' after the last attribute.
#'
#' @examples
#' if (interactive()) {
#'   ui <- tagList(
#'       browsertools::use_browsertools(),
#'       tags$p(
#'          id = "my-text-elem",
#'          class = "text-bold text-size-lg",
#'          `data-value` = "12345",
#'          enable_attributes(),
#'          "You can access this element's attributes in the server"
#'       ),
#'       tags$button(
#'           id = "getAttribs",
#'           class = "shiny-bound-input action-button",
#'           "Get Attributes"
#'       )
#'   )
#'   server <- function(input, output) {
#'        observeEvent(input$getAttribs, {
#'            print(input$`my-text-elem`)
#'        })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @seealso [print_elem()]
#' @return View and print attributes of an html element
#' @keywords browsertools attributes
#'
#' @export
enable_attributes <- function() {
    htmltools::tags$span(
        `data-browsertools-indexible` = "true",
        class = "browsertools-hidden browsertools-attributes",
        style = "display: none;"
    )
}