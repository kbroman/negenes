% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_mutants.R
\name{sim.mutants}
\alias{sim.mutants}
\title{Simulate data for a random transposon mutagenesis experiment}
\usage{
sim.mutants(n.sites, essential, n.sites2 = NULL, n.mutants)
}
\arguments{
\item{n.sites}{A vector specifying the number of transposon insertion sites
in each gene.  All elements must by strictly positive.}

\item{essential}{A vector containing 1's (indicating that the corresponding
gene is essential) and 0's (indicating that the corresponding gene is not
essential). Must be the same length as \code{n.sites}.}

\item{n.sites2}{A vector specfying the number of transposon insertion sites
shared by adjacent genes.  The \emph{i}th element is the number of insertion
sites shared by genes \emph{i} and \emph{i}+1.  The last element is for
sites shared by genes \emph{N} and 1.  If missing, these are assumed to be
all 0.}

\item{n.mutants}{Number of mutants to simulate.}
}
\value{
If \code{n.sites2} is missing or contains all 0's, a vector is
returned containing the number of mutants observed for each gene.

If \code{n.sites2} is not missing and has some positive entries, a matrix
with two columns is returned.  The first column contains the number of
mutants observed for each gene alone; the second column contains the number
of mutants observed shared by adjacent genes.
}
\description{
Simulate data for a random transposon mutagenesis experiment.
}
\examples{

\dontrun{data(Mtb80)

# simulate 44\% of genes to be essential
essential <- rep(0,nrow(Mtb80))
essential[sample(1:nrow(Mtb80),ceiling(nrow(Mtb80)*0.44))] <- 1

# simulate 759 mutants
counts <- sim.mutants(Mtb80[,1], essential, Mtb80[,2], 759)

# run the Gibbs sampler
output <- negenes(Mtb80[,1], counts[,1], Mtb80[,2], counts[,2])}

}
\references{
Blades, N. J. and Broman, K. W. (2002) Estimating the number of
essential genes in a genome by random transposon mutagenesis.  Technical
Report MS02-20, Department of Biostatistics, Johns Hopkins University,
Baltimore, MD.
\url{https://www.biostat.wisc.edu/~kbroman/publications/ms0220.pdf}
}
\seealso{
\code{\link[=negenes]{negenes()}}, \code{\link[=Mtb80]{Mtb80()}}
}
\author{
Karl W Broman, \email{broman@wisc.edu}
}
\keyword{datagen}
