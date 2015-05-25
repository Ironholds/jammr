#include <R.h>
#include <Rinternals.h>

SEXP greet(SEXP x){

  Rprintf("R is free software and comes with ABSOLUTELY NO WARRANTY.\n\
You are welcome to redistribute it under certain conditions.\n\
Type 'license()' or 'licence()' for distribution details.\n\n");
  Rprintf("R is a collaborative project with many contributors.\n\
Type 'contributors()' for more information and\n\
'citation()' on how to cite R or R packages in publications.\n\n");
  Rprintf("Type 'demo()' for some demos, 'help()' for on-line help, or\n\
'help.start()' for an HTML browser interface to help.\n\
Type 'q()' to quit R.\n\n");
  return x;
}
