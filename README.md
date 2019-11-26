# penaltyRegression
  <!-- badges: start -->
  [![Travis build status](https://travis-ci.org/schi006/penaltyRegression.svg?branch=master)](https://travis-ci.org/schi006/penaltyRegression)
  <!-- badges: end -->
  <!-- badges: start -->
  [![Codecov test coverage](https://codecov.io/gh/schi006/penaltyRegression/branch/master/graph/badge.svg)](https://codecov.io/gh/schi006/penaltyRegression?branch=master)
  <!-- badges: end -->
  
## Overview
`penaltyRegression` implements linear regression, ridge regression and lasso in c++ using Armadillo.

1.linear_fit: fit linear regression and return beta, fitted value, residual 
2.ridge_fit: fit ridge regression and return beta, fitted value, residual 
3.lasso_fit: fit lasso regression and return beta, fitted value, residual

## Example

library(penaltyRegression)

###linear regression

#### simulate data
set.seed(0)
x <- matrix(runif(50), ncol = 1)
y <- matrix(2*x[,1] + rnorm(50,mean = 0, sd=0.1), ncol = 1)
res_linear = linear_fit(x,y)
res_linear$beta
res_linear$fit
res_linear$residual
reg_plot(x, y, res_linear$beta)
res_plot(res_linear$residual, res_linear$fit)



###ridge regression

#### simulate data
set.seed(0)
x <- matrix(runif(100), ncol = 2)
y <- matrix(2*x[,1] + 3*x[,2] + rnorm(50,mean = 0, sd=0.1), ncol = 1)
lambda=0.001
res_ridge = ridge_fit(x,y,lambda)
res_ridge$beta
res_ridge$fit
res_ridge$residual
reg_plot(x, y, res_ridge$beta)
res_plot(res_ridge$residual, res_ridge$fit)




### lasso regression

#### simulate data
set.seed(0)
x <- matrix(runif(100), ncol = 2)
y <- matrix(2*x[,1] + 3*x[,2] + rnorm(50,mean = 0, sd=0.1), ncol = 1)

res_lasso = lasso_fit(x, y, lambda=lambda, tol = 1e-10,max_iter = 10000)
res_lasso$beta
res_lasso$fit
res_lasso$residual


