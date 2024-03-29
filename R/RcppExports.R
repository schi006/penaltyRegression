# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

cpp_linear_fit <- function(x, y) {
    .Call(`_penaltyRegression_cpp_linear_fit`, x, y)
}

cpp_ridge_fit <- function(x, y, lambda) {
    .Call(`_penaltyRegression_cpp_ridge_fit`, x, y, lambda)
}

cpp_softmax <- function(x, y) {
    .Call(`_penaltyRegression_cpp_softmax`, x, y)
}

cpp_lasso_fit <- function(x, y, lambda, tol, max_iters) {
    .Call(`_penaltyRegression_cpp_lasso_fit`, x, y, lambda, tol, max_iters)
}

cpp_predict <- function(x, beta) {
    .Call(`_penaltyRegression_cpp_predict`, x, beta)
}

