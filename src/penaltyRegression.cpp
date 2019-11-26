
#include "RcppArmadillo.h"
// using namespace arma;
// using namespace Rcpp;


// Fit the linear regression model.

// [[Rcpp::export]]
arma::colvec cpp_linear_fit(const arma::mat & x, const arma::mat & y) {
  // solve() is faster! but either one is faster than lm(), based on my test
  // return (x.t() * x ).i() * x.t() * y;
  return arma::solve(x, y); 
}


// Fit Ridge regression model.

// [[Rcpp::export]]
arma::colvec cpp_ridge_fit(const arma::mat & x, const arma::mat & y, double lambda) {
  arma::mat aux = arma::eye(x.n_cols, x.n_cols);
  arma::mat inv_term = arma::inv(x.t() * x + lambda*aux);
  arma::mat res = inv_term*x.t()*y;
  return res;
};


// define helper function, which is used in fitting LASSO.

// [[Rcpp::export]]
arma::colvec cpp_softmax(const arma::colvec x, const arma::colvec y) {
  arma::mat aux = arma::zeros(x.n_elem);
  return sign(x) % max(abs(x) - y, aux);
}


// Fit LASSO regression model.

// [[Rcpp::export]]
arma::colvec cpp_lasso_fit(const arma::mat x, const arma::colvec y, double lambda, double tol, int max_iters){
  int n_col = x.n_cols;
  bool conv_flag = false;
  arma::mat xx = x.t() * x;
  arma::colvec xy = x.t() * y;

  arma::colvec beta = solve(xx + diagmat(lambda * arma::ones(n_col)), xy);

  // shooting algorithm by Fu.
  
  int iter = 0;
  arma::colvec beta_prev, temp_d, temp_n;

  while (!conv_flag && (iter < max_iters)){
    
    iter = iter + 1;
    beta_prev = beta;

    for (int j = 0; j < n_col; j++){
      temp_d = 2 * xx(j,j);
      
      temp_n = 2 * xy(j) - dot(2 * xx.row(j), beta) + beta(j) * 2 * xx(j,j);
      
      // convert 1x1 matrix to pure scalar
      beta(j) = as_scalar(cpp_softmax(temp_n / temp_d, lambda / temp_d));
      
    }
    
    // tol measured by L1 norm.
    conv_flag =  norm(beta_prev - beta, 1) < tol; 
  }
  return beta;

}



// Prediction using the model

// [[Rcpp::export]]
arma::colvec cpp_predict(const arma::mat & x, const arma::colvec & beta) {
  return x*beta;
};
