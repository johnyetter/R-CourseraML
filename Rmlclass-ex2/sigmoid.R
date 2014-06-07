#SIGMOID Compute sigmoid functoon
#   J = SIGMOID(z) computes the sigmoid of z.
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

sigmoid <- function(z){
  # You need to return the following variables correctly 
  g = matrix(0,nrow(z),ncol(z))
  
  g = 1.0 / (1.0 + exp(-z));
}


