# Machine Learning Online Class - Exercise 2: Logistic Regression
#
#  This file contains code that helps you get started on the second part
#  of the exercise which covers regularization with logistic regression,
#  as well as polynomial linear regression.
#  Background
#  ----------
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

# Initialization
rm(list = ls(all.names = TRUE)) # clear all variables from memory
graphics.off() # Clear any plots
cat("\014") # Clear the R terminal

# Read our data
data <- read.csv("ex2data2.txt", header = FALSE)
X = as.matrix(data[, 1:2]) # Independent variable data
y = as.matrix(data[, 3]) # Training labels

source('plotData.R')
plotData(X, y, c(-1,1.5))
title(xlab="Microchip Test 1", ylab="Microchip Test 2")
legend('topright', c("y = 1","y = 0"), col=c("black","black"), 
       pch=c(3,21), pt.cex=c(1,1.5), pt.bg=c("BLACK", "YELLOW"),pt.lwd=2,
       bty = "n")

readline(prompt="\nProgram paused. Press enter to continue.\n")

# =========== Part 1: Regularized Logistic Regression ============
#  In this part, you are given a dataset with data points that are not
#  linearly separable. However, you would still like to use logistic 
#  regression to classify the data points. 
#
#  To do so, you introduce more features to use -- in particular, you add
#  polynomial features to our data matrix (similar to polynomial regression).


# Add Polynomial Features

# Note that mapFeature also adds a column of ones for us, so the intercept
# term is handled
source('mapFeature.R')
X = mapFeature(X[,1], X[,2])
# Initialize fitting parameters
initial_theta = matrix(rep(0, ncol(X)))
# Set regularization parameter lambda to 1
lambda = 1;

# Compute and display initial cost and gradient for regularized logistic
# regression
#[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);
source('costFunctionReg.R')
cost = costFunctionReg(initial_theta, X, y, lambda)
grad = gradientFunctionReg(initial_theta, X, y, lambda)

cat(paste('Cost at initial theta (zeros): ', cost, '\n'))
readline(prompt="\nProgram paused. Press enter to continue.\n")

# ============= Part 2: Regularization and Accuracies =============
#  In this part, we will get to try different values of lambda and 
#  see how regularization affects the decision coundart
#
#  We try the following values of lambda (0, 1, 10, 100).
#

# Initialize fitting parameters
initial_theta = matrix(rep(0, ncol(X)))
# Set regularization parameter lambda to 1
lambda = 1;

library("stats")
optim.result <- optim(initial_theta, fn = costFunctionReg, 
                      gr = function(...) gradientFunctionReg(...), 
                      X = X, y = y, lambda = lambda, 
                      method = "BFGS", control = list(maxit = 400))
theta = optim.result$par
cat(paste('Cost at theta found by R optim: ', optim.result$value, '\n'))

source('plotDecisionBoundary.R')
plotDecisionBoundary(theta, X, y, c(-1,1.5))
title(xlab="Microchip Test 1", ylab="Microchip Test 2")
legend('topright', c("y = 1","y = 0","Decision Boundary"), 
       col=c("black","black","green"), pch=c(3,21,NA), pt.cex=c(1,1.5,1), 
       pt.bg=c("BLACK", "YELLOW", NA),pt.lwd=2,lwd=c(NA,NA,2),bty = "n")

source('predict.R')
p = predict(theta, X)

cat(paste('Train Accuracy: ', mean(as.double(p == y)), '\n'))

readline(prompt="\nProgram paused. Press enter to continue.\n")

# Initialize fitting parameters
initial_theta = matrix(rep(0, ncol(X)))
# Set regularization parameter lambda to 1
lambda = 0;

library("stats")
optim.result <- optim(initial_theta, fn = costFunctionReg, 
                      gr = function(...) gradientFunctionReg(...), 
                      X = X, y = y, lambda = lambda, 
                      method = "BFGS", control = list(maxit = 400))
theta = optim.result$par
cat(paste('Cost at theta found by R optim: ', optim.result$value, '\n'))

source('plotDecisionBoundary.R')
plotDecisionBoundary(theta, X, y, c(-1,1.5))
title(xlab="Microchip Test 1", ylab="Microchip Test 2")
legend('topright', c("y = 1","y = 0","Decision Boundary"), 
       col=c("black","black","green"), pch=c(3,21,NA), pt.cex=c(1,1.5,1), 
       pt.bg=c("BLACK", "YELLOW", NA),pt.lwd=2,lwd=c(NA,NA,2),bty = "n")

readline(prompt="\nProgram paused. Press enter to continue.\n")

# Initialize fitting parameters
initial_theta = matrix(rep(0, ncol(X)))
# Set regularization parameter lambda to 1
lambda = 100;

library("stats")
optim.result <- optim(initial_theta, fn = costFunctionReg, 
                      gr = function(...) gradientFunctionReg(...), 
                      X = X, y = y, lambda = lambda, 
                      method = "BFGS", control = list(maxit = 400))
theta = optim.result$par
cat(paste('Cost at theta found by R optim: ', optim.result$value, '\n'))

source('plotDecisionBoundary.R')
plotDecisionBoundary(theta, X, y, c(-1,1.5))
title(xlab="Microchip Test 1", ylab="Microchip Test 2")
legend('topright', c("y = 1","y = 0","Decision Boundary"), 
       col=c("black","black","green"), pch=c(3,21,NA), pt.cex=c(1,1.5,1), 
       pt.bg=c("BLACK", "YELLOW", NA),pt.lwd=2,lwd=c(NA,NA,2),bty = "n")
