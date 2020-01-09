calculate_gauss <- function(a, b) {
  n <- nrow(a)
  # det <- 1
  # computes the array of col maximal elements
  # loop over columns to get the max element in col
  for (i in seq_len(n - 1)) {
    j <- which.max(a[i:n, i]) + i - 1
    if (j != i) {
      a[c(i, j), i:n] <- a[c(j, i), i:n]
      b[c(i, j), ] <- b[c(j, i), ]
    }
    # finds the multiplier to eliminate
    k <- seq(i + 1, n)
    for (j in k) {
      s <- a[[j, i]] / a[[i, i]] 
      a[j, k] <- a[j, k] - s * a[i, k]
      # do the same for the other vector
      b[j, ] <- b[j, ] - s * b[i, ]
    }
  }
  
  # do the same for rows
  for (i in seq(n, 1)) {
    if (i < n) {
      for (j in seq(i + 1, n)) {
        b[i, ] <- b[i, ] - a[[i, j]] * b[j, ]
      }
    }
    b[i, ] <- b[i, ] / a[[i, i]]
  }
  
  return(x=b)
}
a <- matrix(c(1,2,-1,1,-1,-2,3,5,4), nrow = 3, ncol = 3)
b <- matrix(c(1,2,6), nrow = 3, ncol = 1)

val <- calculate_gauss(a,b)
val
