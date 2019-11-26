#' linear
#' 
#' This function estimates linear regression model with OLS.
#' The output is supposed to be exactly same as lm().
#' 
#' @param x input independent data matrix - nxp 
#' @param y input dependent vector - nx1
#' @return estimated beta 

#' @rdname linear
#'
#' @examples
#'
#' library(penaltyRegression)
#' set.seed(0)
#' x <- matrix(runif(50), ncol = 1)
#' y <- matrix(2*x[,1] + rnorm(50,mean = 0, sd=0.1), ncol = 1)
#' 
#' res_linear = linear_fit(x,y)
#' res_linear$beta
#' res_linear$fit
#' res_linear$residual
#' reg_plot(x, y, res_linear$beta)
#' res_plot(res_linear$residual, res_linear$fit)
#' 
#' lm(y~x-1)$coef




#' @export
linear_fit = function(x, y) {
  beta = cpp_linear_fit(x, y)
  fit = cpp_predict(x, beta)
  residual = y - fit
    
  res = list(beta=beta, fit=fit, residual = residual)
  
  res
}
