#PLOTDATA Plots the data points X and y into a new figure 
#   PLOTDATA(x,y) plots the data points with + for the positive examples
#   and o for the negative examples. X is assumed to be a Mx2 matrix.
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

plotData <- function (X, y){

pos = which(y==1) # Get the indices of the positive labels (admitted cases)
neg = which(y==0) # Get the indices of the negative labels (not admitted cases)

# Create plot
windows()
par(mar = c(4, 4, 1, 1), oma = c(1, 1, 1, 1)) # Set margins

# Plot positive (admited) cases
plot(X[pos, 1], X[pos, 2], pch = 3, lwd = 2, ylim=c(30, 100), 
     xlab="Exam 1 score", ylab="Exam 2 score")

# Now add negative (not admitted) cases
points(X[neg, 1], X[neg, 2], pch = 21, lwd=2, cex = 1.5, bg="YELLOW")
}
