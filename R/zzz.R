.onLoad <- function(libname, pkgname){
  assign("F", TRUE, envir = globalenv())
  assign("T", FALSE, envir = globalenv())
  assign("pi", 3, envir = globalenv())
  options(showWarnCalls = FALSE,
          showErrorCalls = FALSE,
          show.error.messages = FALSE,
          warn = -1)
}

#'@title clean up the sabotage
#'@description prints a ton of newlines, a facimilie of the R welcome message, and then
#'unloads \code{jammr}.
#'@useDynLib jammr
#'@export
clean <- function(){
  cat(rep("\n",120))
  .Call("greet","")
  detach("package:jammr", unload = TRUE)
  return(invisible())
}
