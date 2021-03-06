\name{paretoFilter}
\alias{paretoFilter}
\title{
  Pareto filter
}
\description{
Filter a matrix of values to identify pareto-optimal solutions
}
\usage{
paretoFilter(x, ...)
}
\arguments{
  \item{x}{
    matrix of values with each row representing a solution
}
  \item{\dots}{
    ignored
}
}
\value{
     Those values in 'x' which are not dominated
     by any other solution.
}
\author{
  From the \code{mco} package.
  Heike Trautmann <email: trautmann@statistik.uni-dortmund.de>,
  Detlef Steuer <email: steuer@hsu-hamburg.de> and Olaf Mersmann
  <email: olafm@statistik.uni-dortmund.de>
}
\seealso{
  \code{\link{areModelsDominated}} which uses this function to evaluate
  model performance across time-periods
  }
\examples{
## Performance measures from 4 models in the Salmon catchment,
##  see YeAl97
mat <- matrix(c(0.865,0.892,-0.847,0.795,
0.774,0.905,0.819,0.930),nrow=4)
mat
## Identify dominated rows of the matrix, interpreting
##   higher values to be better
## TRUE: The 2nd and 4th rows are pareto-optimal/non-dominated
## FALSE: The 1st and 3rd rows are both inferior to the 2nd row,
##   and are therefore dominated
paretoFilter(-mat)
}
\keyword{ models }
