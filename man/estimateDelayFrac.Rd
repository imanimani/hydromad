\name{estimateDelayFrac}
\alias{estimateDelayFrac}
\title{
  Estimate the dead time between input and output, with a
  fractional component (redistribution of the input)
}
\description{
  Optimises the delay \code{TDopt}
  using \code{\link{lagFrac}} to maximise the correlation between the delayed input
  time series and (rises in) the corresponding time series
}
\usage{
estimateDelayFrac(DATA, rises = TRUE, lag.max = hydromad.getOption("max.delay"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DATA}{ a \code{\link{ts}}-like object with named components:
	\describe{
	  \item{\code{U}}{ input (forcing) time series. }
	  \item{\code{Q}}{ output (response) time series. }
	}
  }
  \item{rises}{ use only rises in the output to estimate delay. }
  \item{lag.max}{ largest delay (in time steps) to consider. }
}
\details{
  \code{\link{estimateDelay}} may be preferred if there's no good reason
  to have a fractional lag/redistribution of the input across days.
}
\value{
  The estimated delay as an integer number of time steps.
}
\author{
  Joseph Guillaume
}
\seealso{
  \code{\link{estimateDelay}}, \code{\link{lagFrac}}
}
\examples{
L<-0.6 ## Lag of 0.6
P <- c(2,0,5,1,6,10,0,0,0)
V1<-lagFrac(P,L)

estimateDelay(cbind(P,V1), rises = FALSE)
estimateDelayFrac(cbind(U=P,Q=V1),lag.max=5,rises=FALSE)
}
\keyword{ ts}
