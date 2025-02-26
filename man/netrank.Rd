% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/netrank.R
\name{netrank}
\alias{netrank}
\alias{print.netrank}
\title{Frequentist method to rank treatments in network}
\usage{
netrank(
  x,
  small.values = x$small.values,
  method,
  nsim,
  common = x$common,
  random = x$random,
  warn.deprecated = gs("warn.deprecated"),
  ...
)

\method{print}{netrank}(
  x,
  common = x$common,
  random = x$random,
  sort = TRUE,
  digits = gs("digits.prop"),
  warn.deprecated = gs("warn.deprecated"),
  ...
)
}
\arguments{
\item{x}{An object of class \code{netmeta} or \code{rankogram}.}

\item{small.values}{A character string specifying whether small
treatment effects indicate a beneficial (\code{"good"}) or
harmful (\code{"bad"}) effect, can be abbreviated.}

\item{method}{A character string specifying whether the
\code{"P-score"} or \code{"SUCRA"} ranking metric will be
calculated.}

\item{nsim}{Number of simulations to calculate SUCRAs.}

\item{common}{A logical indicating whether to print P-scores or
SUCRAs for the common effects model.}

\item{random}{A logical indicating whether to print P-scores or
SUCRAs for the random effects model.}

\item{warn.deprecated}{A logical indicating whether warnings should
be printed if deprecated arguments are used.}

\item{\dots}{Additional arguments passed on to
\code{\link{print.data.frame}} function (used internally).}

\item{sort}{A logical indicating whether printout should be sorted
by decreasing P-score.}

\item{digits}{Minimal number of significant digits, see
\code{\link{print.default}}.}
}
\value{
An object of class \code{netrank} with corresponding \code{print}
function. The object is a list containing the following components:
\item{ranking.common}{A named numeric vector with P-scores or SUCRAs
  for the common effects model.}
\item{Pmatrix.common}{Numeric matrix based on pairwise one-sided
  p-values for the common effects model.}
\item{ranking.random}{A named numeric vector with P-scores or
  SUCRAs for the random effects model.}
\item{Pmatrix.random}{Numeric matrix based on pairwise one-sided
  p-values of the random effects model.}
\item{small.values, method, x}{As defined above.}
\item{version}{Version of R package netmeta used to create object.}
}
\description{
Ranking treatments in frequentist network meta-analysis with and
without resampling methods.
}
\details{
Treatments are ranked based on a network meta-analysis. Ranking is
performed by a ranking metric: P-score or SUCRA.

P-scores are based solely on the point estimates and standard
errors of the network estimates. They measure the extent of
certainty that a treatment is better than another treatment,
averaged over all competing treatments (Rücker and Schwarzer 2015).

The Surface Under the Cumulative RAnking curve (SUCRA) is the rank
of treatment \emph{i} within the range of treatments, measured on a
scale from 0 (worst) to 1 (best) (Salanti et al. 2011). A
resampling method is used to calculate SUCRAs for frequentist
network meta-analysis. The number of simulations is determine by
argument \code{nsim}.

The interpretation of P-scores and SUCRAs is comparable.

The P-score of treatment \emph{i} is defined as the mean of all 1 -
P[\emph{j}] where P[\emph{j}] denotes the one-sided P-value of
accepting the alternative hypothesis that treatment \emph{i} is
better than one of the competing treatments \emph{j}. Thus, if
treatment \emph{i} is better than many other treatments, many of
these P-values will be small and the P-score will be large. Vice
versa, if treatment \emph{i} is worse than most other treatments,
the P-score is small.

The P-score of treatment \emph{i} can be interpreted as the mean
extent of certainty that treatment \emph{i} is better than another
treatment.
}
\examples{
data(Senn2013)

net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
  data = Senn2013, sm = "MD", random = FALSE)

nr1 <- netrank(net1)
nr1
print(nr1, sort = FALSE)

\dontrun{
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
  data = Senn2013, sm = "MD")

nr2 <- netrank(net2)
nr2
print(nr2, sort = "common")
print(nr2, sort = FALSE)
}

\dontrun{
net3 <- netmeta(TE, seTE, treat1, treat2, studlab,
  data = Senn2013, sm = "MD")

nr3 <- netrank(net3, method = "SUCRA", nsim = 100)
nr3
print(nr3, sort = "common")
print(nr3, sort = FALSE)
}

}
\references{
Rücker G, Schwarzer G (2017):
Resolve conflicting rankings of outcomes in network meta-analysis:
Partial ordering of treatments.
\emph{Research Synthesis Methods},
\bold{8}, 526--36

Salanti G, Ades AE, Ioannidis JP (2011):
Graphical methods and numerical summaries for presenting results
from multiple-treatment meta-analysis: an overview and tutorial.
\emph{Journal of Clinical Epidemiology},
\bold{64}, 163--71
}
\seealso{
\code{\link{netmeta}}, \code{\link{rankogram}}
}
\author{
Gerta Rücker \email{ruecker@imbi.uni-freiburg.de}, Guido
  Schwarzer \email{sc@imbi.uni-freiburg.de}, Theodoros
  Papakonstantinou \email{dev@tpapak.com}
}
