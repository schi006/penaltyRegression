
#' reg_predict
#' 
#' This function aims to predict linear model, OLS / L2 / L1 regularization 
#' 
#' @param x input independent data matrix - nxp 
#' @param beta input coefficients - p
#' @return estimated beta with L1 regularization 

#' @rdname reg_predict
#'
#' @examples
#' 
#' 
#' @export
reg_predict = function (x, beta) {
  cpp_predict(x, beta)
  
}


#' reg_plot
#' 
#' This function aims to create y-x scatter plot.
#' If input col > 1, it will only make y~x1 plot
#' 
#' @param x input data frame for independent variable - nx1
#' @param y input array for dependent variable - n
#' @param beta input coefficients - p
#' @return scatter plot

#' @rdname reg_plot
#'
#' @examples
#' 
#' @export

reg_plot = function(x, y, beta){
  df = data.frame(x=x[,1], y=y)
  p = ggplot2::ggplot(df, aes(x, y))+
    ggplot2::geom_point(color='black', size=1) +
    ggplot2::geom_abline(intercept = 0, slope = beta[1], color = 'red', size=1.5) +
    ggplot2::theme_bw()
  p
}


#' res_plot
#' 
#' This function aims to create residual-fitted scatter plot.
#' 
#' @param residual input data frame for independent variable - n
#' @param fitted input array for dependent variable - n
#' @return scatter plot

#' @rdname res_plot
#'
#' @examples
#' 
#' @export

res_plot = function(residual, fitted){
  df = data.frame(residual=residual, fitted=fitted)
  p = ggplot2::ggplot(df, aes(fitted, residual))+
    ggplot2::geom_point(color='black', size=1) +
    ggplot2::geom_hline(yintercept = 0, color = 'red', size=1.5) +
    ggplot2::theme_bw()
  p
}
