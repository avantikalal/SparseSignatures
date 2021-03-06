% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/signatures.assignment.lasso.R
\name{sigAssignmentEvaluation}
\alias{sigAssignmentEvaluation}
\title{sigAssignmentEvaluation}
\usage{
sigAssignmentEvaluation(
  x,
  beta,
  normalize_counts = TRUE,
  lambda_values = c(0.01, 0.05, 0.1, 0.2),
  max_iterations_lasso = 10000,
  num_processes = Inf,
  seed = NULL,
  verbose = TRUE,
  log_file = ""
)
}
\arguments{
\item{x}{count matrix for a set of n patients and 96 trinucleotides.}

\item{beta}{beta to be fixed during the estimation of alpha.}

\item{normalize_counts}{if true, the input count matrix x is normalize such that the patients have the same number of mutation.}

\item{lambda_values}{value of LASSO to be used for alpha between 0 and 1. This value should be greater than 0. 1 is the value of LASSO 
that would shrink all the signatures to 0 within one step. The higher lambda_values is, the sparser are the resulting exposures, 
but too large values may result in a reduced fit of the observed counts.}

\item{max_iterations_lasso}{Number of maximum iterations to be performed during the sparsification via Lasso.}

\item{num_processes}{Number of processes to be used during parallel execution. To execute in single process mode, 
this parameter needs to be set to either NA or NULL.}

\item{seed}{Seed for reproducibility.}

\item{verbose}{boolean; Shall I print all messages?}

\item{log_file}{log file where to print outputs when using parallel. If parallel execution is disabled, this parameter is ignored.}
}
\value{
A list corresponding to results of the function sigAssignmentLasso for each value of lambda to be tested. This function allows 
to test a good range of lambda values for alpha to be considered. One should keep in mind that too small values generate dense solution, 
while too high ones leads to poor fit. This behavior is resampled in the values of loglik_progression, which should be increasing: 
too small values of lambda results in unstable log-likelihood through the iterations, while too large values make log-likelihood 
drop.
}
\description{
Estimate the range of lambda values for alpha to be considered in the signature assignment. Note that too small values of lambda 
result in dense exposures, but too large values lead to bad fit of the counts.
}
\examples{
data(patients)
data(starting_betas_example)
beta = starting_betas_example[["5_signatures","Value"]]
res = sigAssignmentEvaluation(x=patients[1:100,],
     beta=beta,
     lambda_values=c(0.01,0.05),
     num_processes=NA,
     seed=12345)

}
