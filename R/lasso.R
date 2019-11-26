
#' lasso
#' 
#' This function estimates LASSO.
#' Unfortunatelly, LASSO does not have explicit form equation
#' I use Stochastic Coordinate Descent(Fu. aka. shooting algorithm) to solve linear system with L1 regularization
#' 
#' @param x input independent data matrix - nxp 
#' @param y input dependent vector - nx1
#' @param lambda input penalty multiplier
#' @param tol stopping creteria 1 - minimal change of L1 of beta, default 1e-7
#' @param max_iter stopping creteria 2 - maximal number of iterations, default 10000
#' @return estimated beta with L1 regularization 
#'
#' @examples
#' library(penaltyRegression)
#' set.seed(0)
#' x <- matrix(runif(100), ncol = 2)
#' y <- matrix(2*x[,1] + 3*x[,2] + rnorm(50,mean = 0, sd=0.1), ncol = 1)
#'
#' res_lasso = lasso_fit(x, y, lambda=1, tol = 1e-10,max_iter = 10000)
#' res_lasso$beta
#' res_lasso$fit
#' res_lasso$residual
#' 
#' if(require(glmnet)){
#' glmnet(x, y, alpha = 1, lambda = 1, intercept = FALSE)$beta
#'}

#' @export
lasso_fit <- function(x, y, lambda=1, tol = 1e-7,max_iter = 10000){
  
  beta = cpp_lasso_fit(x, y, lambda, tol,max_iter)
  fit = cpp_predict(x, beta)
  residual = y - fit
  
  res = list(beta=beta, fit=fit, residual = residual)
  res
}

