#' ridge
#' 
#' This function estimates ridge regression model.
#' Ridge has explicit form equation
#' 
#' @param x input independent data matrix - nxp 
#' @param y input dependent vector - nx1
#' @param lambda input penalty multiplier
#' @return estimated beta with L2 regularization 

#' @rdname ridge
#'
#' @examples
#'
#' library(penaltyRegression)
#' set.seed(0)
#' x <- matrix(runif(100), ncol = 2)
#' y <- matrix(2*x[,1] + 3*x[,2] + rnorm(50,mean = 0, sd=0.1), ncol = 1)
#' 
#' lambda=0.001
#' res_ridge = ridge_fit(x,y,lambda)
#' res_ridge$beta
#' res_ridge$fit
#' res_ridge$residual
#' reg_plot(x, y, res_ridge$beta)
#' res_plot(res_ridge$residual, res_ridge$fit)
#' 
#' require(MASS)
#' require(glmnet)
#' lm.ridge(y~x-1, Inter = FALSE, lambda=lambda)
#' glmnet(x, y, alpha = 0, lambda = lambda, intercept = FALSE)$beta

#' @export
ridge_fit = function(x, y, lambda) {
  
  beta = cpp_ridge_fit(x, y, lambda)
  fit = cpp_predict(x, beta)
  residual = y - fit
  
  res = list(beta=beta, fit=fit, residual = residual)
  
  res

}
