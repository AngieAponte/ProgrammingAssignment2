## R code to do the inverse an a matrix
## To meet the goal, we need two function 

## the makeCacheMatrix creates a matrix that stores and cache's its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) i <<- solve
  getmatrix <- function() i
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## The next function calculates the inverse of matrix. 
## This function gets the matrix' inverse from the cache if it has already been calculed. O
## Otherwise, it calculates the matrix' inverse of the data and sets the value of the data in the cache.

makeCacheMatrix()

cacheSolve <- function(x, ...) {
  i <- x$getmatrix()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setmatrix(i)
  i
}

