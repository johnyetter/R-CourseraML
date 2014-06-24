#PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
#the decision boundary defined by theta
#   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
#   positive examples and o for the negative examples. X is assumed to be 
#   a either 
#   1) Mx3 matrix, where the first column is an all-ones column for the 
#      intercept.
#   2) MxN, N>3 matrix, where the first column is all-ones

plotDecisionBoundary <- function(theta, X, y, lim = NULL){

  # Plot Data
  source('plotData.R')
  plotData(X[,2:3], y, lim);

  if (ncol(X) <= 3){
    # Only need 2 points to define a line, so choose two endpoints
    plot_x = c(min(X[,2])-2,  max(X[,2])+2)
  
    # Calculate the decision boundary line
    plot_y = (-1/theta[3])*(theta[2]*plot_x + theta[1]);
    a = (plot_y[2] - plot_y[1])/(plot_x[2] - plot_x[1])
    b = plot_y[1] - a*plot_x[1]
    
    # Plot decision boundary
    abline(b,a, lwd=2, col="blue")
  }
  else{
    #Here is the grid range
    u = seq(-1,1.5,length=50)
    v = seq(-1,1.5,length=50)
    z = matrix(0, nrow=length(u), ncol=length(v))
    # Evaluate z = theta*x over the grid
    for (i in 1:length(u)){
      for (j in 1:length(v)){
        z[i,j] = mapFeature(u[i], v[j])%*%theta;
      }
    }
    z = t(z) # important to transpose z before calling contour
   
    # Plot z = 0
    # Notice you need to specify the range [0, 0]
    contour(u, v, z, drawlabels=FALSE, nlevels=1, col="black", lwd=3, add=TRUE)
    #contour(u, v, z, method = "edge")
    #contour(u, v, z)
  }
}