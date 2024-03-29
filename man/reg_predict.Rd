% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility.R
\name{reg_predict}
\alias{reg_predict}
\title{reg_predict}
\usage{
reg_predict(x, beta)
}
\arguments{
\item{x}{input independent data matrix - nxp}

\item{beta}{input coefficients - p}
}
\value{
predicted value
}
\description{
This function aims to predict linear model, OLS / L2 / L1 regularization
}
\examples{
set.seed(0)
library(penaltyRegression)
x <- matrix(runif(100), ncol = 2)
y <- matrix(2x[,1] + 3x[,2] + rnorm(50,mean = 0, sd=0.1), ncol = 1)
lambda=0.001
res_ridge = ridge_fit(x,y,lambda) #fit ridge regression
beta=res_ridge$beta
reg_predict(x, beta) #predited y

}
