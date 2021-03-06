\name{fitBySCE}
\alias{fitBySCE}
\title{
  Fit a hydromad model using the SCE (Shuffled Complex Evolution) algorithm.
}
\description{
  Fit a hydromad model using the SCE (Shuffled Complex Evolution) algorithm.
}
\usage{
fitBySCE(MODEL, 
         objective = hydromad.getOption("objective"),
         control = hydromad.getOption("sce.control"),
         vcov = FALSE)
}
\arguments{
  \item{MODEL}{
    a model specification created by \code{\link{hydromad}}. It should
    not be fully specified, i.e one or more parameters should be defined
    by \emph{ranges} of values rather than exact values.
  }
  \item{objective}{
    objective function to maximise, given as a \code{function(Q, X, ...)}.
    See \code{\link{objFunVal}}.
  }
  \item{control}{
    settings for the SCE algorithm. See \code{\link{SCEoptim}}.
  }
  \item{vcov}{
    if \code{vcov = TRUE}, the parameter variance-covariance matrix
    will be estimated from the final population.
    It can be extract using \code{\link{vcov}}.
  }
}
\value{
  the best model from those sampled, according to the given
  \code{objective} function. Also, these extra elements are inserted:
  \item{fit.result}{
    the result from \code{\link{SCEoptim}}.
  }
  \item{objective}{
    the \code{objective} function used.
  }
  \item{funevals}{
    total number of evaluations of the model simulation function.
  }
  \item{timing}{
    timing vector as returned by \code{system.time}.
  }
}
\author{
  Felix Andrews \email{felix@nfrac.org}
}
\seealso{
  \code{\link{SCEoptim}},
  \code{\link{objFunVal}}
}
\examples{
data(Cotter)
x <- Cotter[1:1000]

## IHACRES CWI model with power law unit hydrograph
modx <- hydromad(x, sma = "cwi", routing = "powuh")
modx

## run with cut-down settings (for a speedy example only!)
foo <- fitBySCE(modx, control = list(maxit = 5, ncomplex = 2))

summary(foo)

## return value from SCE:
str(foo$fit.result)

## plot objective function value convergence over time
xyplot(optimtrace(foo, raw = TRUE), screens = 1, type = "p",
  jitter.x = TRUE, ylim = c(0.7, NA), xlim = c(0, NA),
  xlab = "function evaluations", ylab = "objective fn. value") +
layer(panel.average(..., horiz = FALSE, fun = max, lwd = 2))
}
\keyword{ optimization }
