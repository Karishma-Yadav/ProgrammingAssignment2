## A pair of functions cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse.

  makeCacheMatrix <- function(x = matrix()) {
    j <- NULL
    set <- function(y){
      x <<- y
      j <<- NULL
    }
    get <- function()x
    setInverse <- function(inverse) j <<- inverse
    getInverse <- function() j 
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
  }


##This Function computes the inverse of a special matrix created by above makeCacheMatrix above.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invr <- x$getInverse()
  if(!is.null(invr)) {
    message("getting cached data")
    return(invr)
  }
  mat <- x$get()
  invr <- solve(mat, ...)
  x$setInverse(invr)
  invr
}
