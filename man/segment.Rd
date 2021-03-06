% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/segment.R
\name{segment}
\alias{segment}
\title{Learn a model and produce a segmentation}
\usage{
segment(counts, regions, nstates = NULL, model = NULL, notrain = FALSE,
  collapseInitP = notrain, nthreads = 1, split4speed = FALSE,
  maxiter = 200, ...)
}
\arguments{
\item{counts}{Count matrix or list of count matrices matching with the
\code{regions} parameter. Each row of the matrix represents a mark and each
column a bin resulting from dividing the genomic regions into non-overlapping
bins of equal size. The rows of the matrix must be named with the
name of the marks and these names must be unique.}

\item{regions}{GRanges object containing the genomic regions of interest.
Each of these regions corresponds to a set of bins and each bin to a column
of the count matrix. The binsize is automatically derived by comparing
the columns of the count matrix with the width of the regions.}

\item{nstates}{Number of states to learn.}

\item{model}{A list with the parameters that describe
the HMM. Missing parameters will be learned, and the provided
parameters will be used as initial parameters for the learning
algorithm. If \code{train==FALSE} the parameter set must be
complete and no learning will take place.}

\item{notrain}{If FALSE, the parameters will be learned, otherwise
the provided parameters (with the \code{model} option) will be
used without learning to produce a segmentation.}

\item{collapseInitP}{In case a model with multiple initial probabilities
is provided, should those probabilities be averaged and reduced to
one initial probabilities vector? If you are not sure
about what this means, don't set this option.}

\item{nthreads}{number of threads used for learning}

\item{split4speed}{add artificial splits in the input regions to improve
the parallelism of the forward-backward algorithm. Usually the results change
very little and the algorithm runs considerably faster, if the number of
input regions is smaller than the number of threads. See \code{?kfoots} for
more details.}

\item{maxiter}{Maximum number of iterations for learning.}

\item{...}{Advanced options for learning. Type
\code{epicseg:::advancedOpts} to see which options are allowed,
and type \code{?kfoots} to see what the options do.}
}
\value{
A list with the following arguments:
    \item{segments}{The segmentation as a GRanges object.
    The slot \code{names} of this object contains a number from
    1 to nstates saying which state each segment belongs to.}
    \item{model}{A list containing all the parameters of the model.}
    \item{posteriors}{A matrix of size \code{nstates*ncol(counts)} containing the posterior
           probability that a given datapoint is generated by the given state}
    \item{states}{An integer vector of length \code{ncol(counts)} saying
    which state each bin is associated to (using the posterior decoding
    algorithm). This vector is used to create the \code{segments} argument.}
    \item{viterbi}{Same as \code{states}, but using the viterbi algorithm.}
    \item{loglik}{the log-likelihood of the whole dataset.}
}
\description{
Learn a model and produce a segmentation
}

