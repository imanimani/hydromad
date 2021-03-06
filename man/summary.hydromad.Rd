\name{summary.hydromad}
\alias{summary.hydromad}
\alias{print.summary.hydromad}
\alias{print.summaryWithBreaks.hydromad}
\alias{summary.hydromad.runlist}
\title{ Assess and summarise performance of Hydromad models }
\description{
  Assess and summarise performance of Hydromad models.
}
\usage{
\method{summary}{hydromad}(object, breaks = NULL, 
        stats = hydromad.getOption("summary.stats"),
        with.hydrostats = TRUE, na.action = na.exclude, ...)

\method{summary}{hydromad.runlist}(object, with.hydrostats = FALSE, ...)
}
\arguments{
  \item{object}{ an object of class \code{hydromad}. }
  \item{breaks}{
    if specified, break up the time series and calculate statistics for each chunk.
    Can be a vector of cut points \emph{or} number of intervals to cut
    into \emph{or} an interval specification, one of "sec", "min",
    "hour", "day", "DSTday", "week", "month" or "year", optionally
    preceded by an integer and a space, or followed by "s". 
    See \code{\link{cut.Date}}.
  }
  \item{stats}{
    which performance statistics to compute. The definitions are looked
    up by name in \code{\link{hydromad.stats}()}. See Details.
  }
  \item{with.hydrostats}{
    to also include \code{timesteps}, \code{missing} (number of
    timesteps with missing data), \code{mean.P}, \code{mean.Q},
    \code{runoff} (mean rainfall and streamflow, and their ratio).
  }
  \item{na.action}{
    an optional function to apply to the data to treat missing values before
    calculating statistics.
  }
  \item{\dots}{
    ignored.
  }
}
\details{
  Definitions of statistics are looked up by name in
  \code{\link{hydromad.stats}()}, and you can also use that
  function to add new statistics. 
}
\value{
  \code{summary} returns a list with named entries for each of the
  chosen stats (\code{stats}). When \code{breaks} is given it retuns a
  \code{zoo} object of class \code{"summaryWithBreaks"}.
}
\author{ Felix Andrews \email{felix@nfrac.org} }
\seealso{
  \code{\link{hydromad.stats}},
  \code{\link{objFunVal}} for a way to calculate statistic values directly;
  \code{\link{hydromad.object}}
}
\examples{

data(HydroTestData)
mod0 <- hydromad(HydroTestData, sma = "scalar",
                 routing = "expuh", tau_s = 10)
mod0

summary(mod0)

summary(mod0, breaks = "months")
#summary(mod0, breaks = 3)

allstats <- names(hydromad.stats())
summary(mod0, stats = allstats)

objFunVal(mod0, hmadstat("r.sq.log"))

str(objFunVal(mod0, hydromad.stats()))

}
\keyword{ methods }

