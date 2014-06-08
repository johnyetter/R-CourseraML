# Coursera Machine Learning Online Class - Exercise 2: Logistic Regression
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

# Initialization
rm(list = ls(all.names = TRUE)) # clear all variables from memory
graphics.off() # Clear any plots
cat("\014") # Clear the R terminal

# Read our data
data <- read.csv("ex2data1.txt", header = FALSE)
X = as.matrix(data[, 1:2]) # Independent variable data
y = as.matrix(data[, 3]) # Training labels

# ==================== Part 1: Plotting ====================
#  We start the exercise by first plotting the data to understand the 
#  the problem we are working with.

cat(paste("Plotting data with + indicating (y = 1) examples and o indicating",
"(y = 0) examples.\n"))

source('plotData.R') # Load our plot function
plotData(X, y)
legend('topright', c("Admitted","Not admitted"), col=c("black","black"), 
       pch=c(3,21), pt.cex=c(1,1.5), pt.bg=c("BLACK", "YELLOW"),pt.lwd=2,
       bty = "n")

readline(prompt="\nProgram paused. Press enter to continue.\n")

# ============ Part 2: Compute Cost and Gradient ============
#  In this part of the exercise, we implement the cost and gradient
#  for logistic regression. The code is found in costFunction.R

#  Setup the data matrix appropriately, and add ones for the intercept term
m = nrow(X)
n = ncol(X)

# Add intercept term to x and X_test
X = cbind(1,X)

# Initialize fitting parameters
initial_theta = as.matrix(rep(0, n+1))

# Compute and display initial cost and gradient
source('costFunction.R')
costResult = costFunction(initial_theta, X, y)
cost = costResult[[1]]
grad = as.matrix(costResult[[2]])

cat(paste('Cost at initial theta (zeros): ', cost, '\n'))
cat(paste('Gradient at initial theta (zeros): \n'))
cat(paste(grad))

readline(prompt="\nProgram paused. Press enter to continue.\n")

# ============= Part 3: Optimizing using optim  =============
#  In this part, we use a built-in function (optim) to find the
#  optimal parameters theta.
#
#  We use costFunctionNoGrad, which returns only the cost (not the grad
#  value), because the R optim command expects a simple numeric return value.
library("stats")
optim.result <- optim(initial_theta, costFunctionNoGrad, NULL, X, y, method = "BFGS",
             control = list(maxit = 400))
theta = optim.result$par
cat(paste('Cost at theta found by R optim: ', optim.result$value, '\n'))
cat(paste('theta (zeros): \n'))
cat(paste(theta))

source('plotDecisionBoundary.R')
plotDecisionBoundary(theta, X, y)
legend('topright', c("Admitted","Not admitted","Decision Boundary"), 
       col=c("black","black","blue"), pch=c(3,21,NA), pt.cex=c(1,1.5,1), 
       pt.bg=c("BLACK", "YELLOW", NA),pt.lwd=2,lwd=c(NA,NA,2),bty = "n")

readline(prompt="\nProgram paused. Press enter to continue.\n")

# ============== Part 4: Predict and Accuracies ==============
#  After learning the parameters, you'll like to use it to predict the outcomes
#  on unseen data. In this part, you will use the logistic regression model
#  to predict the probability that a student with score 45 on exam 1 and 
#  score 85 on exam 2 will be admitted.
#
#  Furthermore, you will compute the training and test set accuracies of 
#  our model.
#
#  Your task is to complete the code in predict.m

#  Predict probability for a student with score 45 on exam 1 
#  and score 85 on exam 2 

prob = sigmoid(c(1, 45, 85) %*% theta)
cat(paste('For a student with scores 45 and 85, we predict an admission probability of ', 
          prob, '\n'))

# Compute accuracy on our training set
source('predict.R')
p = predict(theta, X)

cat(paste('Train Accuracy: ', mean(as.numeric(p == y)) * 100, '\n'))

readline(prompt="\nProgram paused. Press enter to continue.\n")
