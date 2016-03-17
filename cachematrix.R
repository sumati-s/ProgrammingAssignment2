## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix: This function creates a special "matrix" object that can
cache its inverse. Which is really a list containing a function to

set the value of the Matrix
get the value of the Matrix
set the value of the Inverse Matrix
get the value of the Inverse Matrix

makeCacheMatrix <- function(x = matrix()) {

	 m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }

        get<-function() x 
	  setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m


        list(set=set, get=get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}



## cacheSolve: This function computes the inverse of the special "matrix" 
returned by makeCacheMatrix above. If the inverse has already been calculated 
(and the matrix has not changed), then the cachesolve should retrieve the 
inverse from the cache.
Computing the inverse of a square matrix is done using solve function. 
For example, if X is a square invertible matrix, then solve(X) returns its inverse.
However, it first checks to see if the inverse has already been calculated. If so, 
it gets the inverse from the cache and skips the computation. Otherwise, it calculates 
the inverse of the data and sets the value of the inverse in the cache via the setmatrix function.


cachesolve <- function(x=matrix(), ...) {
        m <- x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m
}
