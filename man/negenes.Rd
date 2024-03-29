% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/negenes.R
\name{negenes}
\alias{negenes}
\title{Estimate the number of essential genes in a genome}
\usage{
negenes(
  n.sites,
  counts,
  n.sites2 = NULL,
  counts2 = NULL,
  n.mcmc = 5000,
  skip = 49,
  burnin = 500,
  startp = 1,
  trace = TRUE,
  calc.prob = FALSE,
  return.output = FALSE
)
}
\arguments{
\item{n.sites}{A vector specifying the number of transposon insertion sites
in each gene (alone).  All elements must by strictly positive.}

\item{counts}{A vector specifying the number of mutants observed for each
gene (alone).  Must be the same length as \code{n.sites}, and all elements
must be non-negative integers.}

\item{n.sites2}{A vector specfying the number of transposon insertion sites
shared by adjacent genes.  The \emph{i}th element is the number of insertion
sites shared by genes \emph{i} and \emph{i}+1.  The last element is for
sites shared by genes \emph{N} and 1. If NULL, assume all are 0.}

\item{counts2}{A vector specfying the number of mutants shared by adjacent
gene (analogous to \code{n.sites2}). The \emph{i}th element is the number of
mutants at sites shared by genes \emph{i} and \emph{i}+1.  The last element
is for sites shared by genes \emph{N} and 1. If NULL, assume all are 0.}

\item{n.mcmc}{Number of Gibbs steps to perform.}

\item{skip}{An integer; only save every \code{skip} + 1st step.}

\item{burnin}{Number of initial Gibbs steps to run (output discarded).}

\item{startp}{Initial proportion of genes for which no mutant was observed
that will be assumed essential for the Gibbs sampler.  (Genes for which a
mutant was observed are assumed non-essential; other genes are assumed
essential independent with this probability.)}

\item{trace}{If TRUE, print iteration number occassionally.}

\item{calc.prob}{If TRUE, return the log posterior probability (up to an
additive constant) for each saved iteration.}

\item{return.output}{If TRUE, include detailed Gibbs results in the output.}
}
\value{
A list with components \code{n.essential} (containing the total
number of essential genes at each iteration of the Gibbs sampler)
\code{summary} (a vector containing the estimated mean, SD, 2.5 percentile
and 97.5 percentile of the posterior distribution of the number of essential
genes.

The next component, \code{geneprob}, is a vector with one element for each
gene, containing the estimated posterior probability that each gene is
essential.  These are Rao-Blackwellized estimates.

If the argument \code{calc.prob} was true, there will also be a component
\code{logprob} containing the log (base e) of the posterior probability (up
to an additive constant) at each Gibbs step.

If the argument \code{return.output} was true, there will also be a matrix
with \code{n.mcmc} / (\code{skip} + 1) rows (corresponding to the Gibbs
steps) and a column for each gene The entries in the matrix are either 0
(essential gene) or 1 (non-essential gene) according to the state of that
gene at that step in the Gibbs sampler.
}
\description{
Estimate, via a Gibbs sampler, the posterior distribution of the number of
essential genes in a genome with data from a random transposon mutagenesis
experiment. (See the technical report cited below.)
}
\examples{
data(Mtb80)

# simulate 44\% of genes to be essential
essential <- rep(0,nrow(Mtb80))
essential[sample(1:nrow(Mtb80),ceiling(nrow(Mtb80)*0.44))] <- 1

# simulate 759 mutants
counts <- sim.mutants(Mtb80[,1], essential, Mtb80[,2], 759)

# run the Gibbs sampler without returning detailed output
\dontrun{output <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2])}
\dontshow{output <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2],
                            n.mcmc=100, skip=0, burnin=0)}
# run the Gibbs sampler, returning the detailed output
\dontrun{output2 <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2], return=TRUE)}
\dontshow{output2 <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2], return=TRUE,
                            n.mcmc=100, skip=0, burnin=0)}

}
\references{
\itemize{
\item Blades, N. J. and Broman, K. W. (2002) Estimating the number of
essential genes in a genome by random transposon mutagenesis.  Technical
Report MS02-20, Department of Biostatistics, Johns Hopkins University,
Baltimore, MD.
\url{https://www.biostat.wisc.edu/~kbroman/publications/ms0220.pdf}
\item Lamichhane et al. (2003) A post-genomic method for predicting
essential genes at subsaturation levels of mutagenesis:
application to Mycobacterium, tuberculosis. Proc Natl Acad Sci USA
100:7213-7218
\doi{10.1073/pnas.1231432100}
}
}
\seealso{
\code{\link[=sim.mutants]{sim.mutants()}}, \code{\link[=Mtb80]{Mtb80()}}
}
\author{
Karl W Broman, \email{broman@wisc.edu}
}
\keyword{models}
