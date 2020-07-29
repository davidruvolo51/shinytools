#' \code{console_log}
#'
#' Send general information to the browser's console. For example a small array
#' of values or a non-error message. Use `console_error` and `console_warn` for
#' displaying issues.
#'
#' @param message a message to display
#' @param expand if TRUE arrays/objects will be auto expanded (default: FALSE)
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     browsertools::use_browsertools(),
#'     tags$h2("Display Message in the Dev Console"),
#'     tags$p("Open the browser's dev console and click the button below."),
#'     tags$button(
#'        id = "sendMessage",
#'        class = "shiny-bound-input action-button",
#'        "Send Message"
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     observeEvent(input$sendMessage, {
#'         browsertools::console_log(
#'             message = "This is a message"
#'         )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#' @references
#'   \url{https://developer.mozilla.org/en-US/docs/Web/API/Console/log}
#'
#' @seealso [console_error()], [console_table()], [console_warn()], [alert()]
#' @keywords browsertools debugging console
#' @return Outputs an object to the browser's console
#'
#' @export
console_log <- function(message, expand = FALSE) {

    # validate
    if (is.null(message)) stop("argument 'message' is undefined")
    if (!is.logical(expand)) stop("argument 'expand' must be a logical value")

    # send
    session <- shiny::getDefaultReactiveDomain()
    session$sendCustomMessage(
        type = "console_log",
        message= list(
            message = message,
            expand = expand
        )
    )
}