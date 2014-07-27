## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function takes an argument, x, a matrix and returns an object with
## several methods for dealing with the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function (y) {
    x <<- y
    i <<- NULL
  }
  get <- function () x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
## This function attempts to "get" the inverse of the matrix through its
## object's method, "setting" it if it has not yet been set.
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("Inversed is cached, retrieving")
    return (i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i  ## Return a matrix that is the inverse of 'x'
}
