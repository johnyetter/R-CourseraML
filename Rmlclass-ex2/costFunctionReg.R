#COSTFUNCTION Compute cost and gradient for logistic regression
#   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
#   parameter for logistic regression and the gradient of the cost
#   w.r.t. to the parameters.
#
#  Background
#  ------------
# 
#  This file is an R re-implementation of the ex2.m file from the Coursera 
#  Machine Learning course, exercise 2 (Logistic Regression).
#
#  The intention of this series of example exercises is to demostrate how
#  the machine learning algorithms discussed in the Coursera course might be
#  implemented in R, since that is a common request in the discussion forums.
#  It is hoped that the student will use these examples after they have taken
#  and passed the Coursera course to better understand the material and R.
#  Translating this code back to GNU Octave for the purpose of submition for
#  the Coursera course is a violation of the Coursera Honor Code, and is 
#  explicitly against the wishes and intent of the author.

costFunctionReg <- function(theta, X, y, lambda){
  # Initialize some useful values
  m = length(y) # number of training examples
  J = 0
  
  source('sigmoid.R')
  h = sigmoid(X%*%theta)
  log_h = log(h)
  log_1minush = log(1 - h)
  costs = -y * log_h - (1 - y) * log_1minush

  J = (1/m)*sum(costs) + (lambda/(2*m))*t(theta[2:length(theta)])%*%theta[2:length(theta)]
}

gradientFunctionReg <- function(theta, X, y, lambda){
  # Initialize some useful values
  m = length(y) # number of training examples
  grad = matrix(0,1,length(theta))

  source('sigmoid.R')
  h = sigmoid(X%*%theta)
  theta[1]=0
  grad = (1/m) * (t(X)%*%(h - y)) + (lambda/m)*theta
}