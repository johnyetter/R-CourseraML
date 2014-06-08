#PREDICT Predict whether the label is 0 or 1 using learned logistic 
#regression parameters theta

predict <- function(theta, X){

m = nrow(X) # Number of training examples

# You need to return the following variables correctly
p = matrix(0,m,1)
p = sigmoid(X%*%theta);
p = round(p);

}