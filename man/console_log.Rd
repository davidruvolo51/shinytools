% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/console_log.R
\name{console_log}
\alias{console_log}
\title{\code{console_log}}
\usage{
console_log(message)
}
\arguments{
\item{message}{a message to display}
}
\value{
Outputs an object to the browser's console
}
\description{
Send general information to the browser's console. For example a small array
of values or a non-error message. Use \code{console_error} and \code{console_warn} for
displaying issues.
}
\examples{
if (interactive()) {
  library(shiny)
  ui <- tagList(
    browsertools::use_browsertools(),
    tags$h2("Display Message in the Dev Console"),
    tags$p("Open the browser's dev console and click the button below."),
    tags$button(
       id = "sendMessage",
       class = "shiny-bound-input action-button",
       "Send Message"
    )
  )
  server <- function(input, output, session) {
    observeEvent(input$sendMessage, {
        browsertools::console_log(
            message = "This is a message"
        )
    })
  }
  shinyApp(ui, server)
}
}
\references{
\url{https://developer.mozilla.org/en-US/docs/Web/API/Console/log}
}
\seealso{
\code{\link[=console_error]{console_error()}}, \code{\link[=console_table]{console_table()}}, \code{\link[=console_warn]{console_warn()}}
}
\keyword{browsertools}
\keyword{console}
\keyword{debugging}
