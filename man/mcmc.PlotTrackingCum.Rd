% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc.R
\name{mcmc.PlotTrackingCum}
\alias{mcmc.PlotTrackingCum}
\title{Tracking Cumulative Transactions Plot for Pareto/GGG, Pareto/NBD (HB) and 
Pareto/NBD (Abe)}
\usage{
mcmc.PlotTrackingCum(draws, T.cal, T.tot, actual.cu.tracking.data,
  xlab = "Week", ylab = "Cumulative Transactions", xticklab = NULL,
  title = "Tracking Cumulative Transactions", ymax = NULL,
  sample_size = 10000)
}
\arguments{
\item{draws}{MCMC draws as returned by 
\code{\link{pnbd.mcmc.DrawParameters}}, 
\code{\link{pggg.mcmc.DrawParameters}} or 
\code{\link{abe.mcmc.DrawParameters}}}

\item{T.cal}{A vector to represent customers' calibration period lengths (in 
other words, the \code{T.cal} column from a 
customer-by-sufficient-statistic matrix). Considering rounding in order to 
speed up calculations.}

\item{T.tot}{End of holdout period. Must be a single value, not a vector.}

\item{actual.cu.tracking.data}{A vector containing the cumulative number of 
repeat transactions made by customers for each period in the total time 
period (both calibration and holdout periods).}

\item{xlab}{Descriptive label for the x axis.}

\item{ylab}{Descriptive label for the y axis.}

\item{xticklab}{A vector containing a label for each tick mark on the x axis.}

\item{title}{Title placed on the top-center of the plot.}

\item{ymax}{Upper boundary for y axis.}

\item{sample_size}{Sample size for estimating the probability distribution.
See \code{\link{mcmc.ExpectedCumulativeTransactions}}.}
}
\value{
Matrix containing actual and expected cumulative repeat transactions.
}
\description{
Plots the actual and expected cumulative total repeat transactions by all 
customers for the calibration and holdout periods, and returns this 
comparison in a matrix.
}
\details{
The expected transactions need to be sampled. Due to this sampling, the
return result varies from one call to another. Larger values of
\code{sample_size} will generate more stable results.
}
\examples{
cdnow <- cdnow.sample()
cbs <- cdnow$cbs
cum <- elog2cum(cdnow$elog)
# short MCMC runs and small sample size to speedup demo
param.draws <- pnbd.mcmc.DrawParameters(cbs, 
  mcmc = 200, burnin = 100, thin = 20, chains = 1) 
mat <- mcmc.PlotTrackingCum(param.draws, cbs$T.cal, T.tot = 78, cum,
  sample_size = 1000)
}
\seealso{
\code{\link{mcmc.PlotTrackingInc}}
  \code{\link{mcmc.ExpectedCumulativeTransactions}} \code{\link{elog2cum}}
}
