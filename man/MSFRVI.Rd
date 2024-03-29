% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcoap.R
\name{MSFRVI}
\alias{MSFRVI}
\title{Fit the multi-study covariate-augmented linear factor model via variational inference}
\usage{
MSFRVI(
  XList,
  ZList,
  q = 15,
  qs = rep(2, length(XList)),
  rank_use = NULL,
  aList = NULL,
  epsELBO = 1e-05,
  maxIter = 30,
  verbose = TRUE,
  seed = 1
)
}
\arguments{
\item{XList}{A length-M list, where each component represents a matrix and is the observed response matrix from each source/study. Ideally, each matrix should be continuous.}

\item{ZList}{a length-M list with each component a matrix that is the covariate matrix from each study.}

\item{q}{an optional integer, specify the number of study-shared factors; default as 15.}

\item{qs}{a integer vector with length M, specify the number of study-specifed factors; default as 2.}

\item{rank_use}{an optional integer, specify the rank of the regression coefficient matrix; default as NULL, which means that rank is the dimension of covariates in Z.}

\item{aList}{an optional length-M list with each component a vector, the normalization factors of each study; default as full-one vector.}

\item{epsELBO}{an optional positive vlaue, tolerance of relative variation rate of the envidence lower bound value, defualt as '1e-5'.}

\item{maxIter}{the maximum iteration of the VEM algorithm. The default is 30.}

\item{verbose}{a logical value, whether output the information in iteration.}

\item{seed}{an optional integer, specify the random seed for reproducibility in initialization.}
}
\value{
return a list including the following components: (1) F, a list composed by the posterior estimation of study-shared factor matrix for each study; (2) H,  a list composed by the posterior estimation of study-specified factor matrix for each study; 
(3) Sf, a list consisting of the posterior estimation of covariance matrix of study-shared factors for each study; (4) Sh, a list consisting of the posterior estimation of covariance matrix of study-specified factors for each study;
(5) A, the loading matrix corresponding to study-shared factors; (6) B, a list composed by the loading matrices corresponding to the study-specified factors;
(7) bbeta, the estimated regression  coefficient matrix; (8) invLambda, the inverse of the estimated variances of error;  (9) ELBO: the ELBO value when algorithm stops; (7) ELBO_seq: the sequence of ELBO values.
(11) qrlist, the number of factors and rank of regression coefficient matrix used in fitting;  (12) time.use, the elapsed time for model fitting.
}
\description{
Fit the multi-study covariate-augmented linear factor model via variational inference
}
\details{
None
}
\examples{
seed <- 1; nvec <- c(100,300); p<- 300;
d <- 3; q<- 3; qs <- rep(2,2)
datlist <- gendata_simu_multi2(seed=seed, nvec=nvec, p=p, d=d, q=3, qs=qs)
XList <- lapply(datlist$Xlist,  function(x) log(1+x))
fit_msfavi <- MSFRVI(XList, ZList = datlist$Zlist, q=3, qs=qs, rank_use = d)
str(fit_msfavi)
}
\references{
None
}
\seealso{
\code{\link{MultiCOAP}}
}
