## this function can be used to create a matrix and calculate and store the inverse of said matrix
## maximum of one matrix can be stored in the cache at any moment in time

## makeCacheMatrix creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
	x <<- y

## store the matrix in the cache
	m <<- NULL
	}

## get the matrix
	get <- function() x

## set the inverse of said matrix
	setinverse <- function(solve) m<<- solve

## get the inverse of said matrix	
	getinverse <- function() m

## create an ordered collection of objects to catch all neccesary functions from makeCacheMatrix in
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## this function returns a matrix that is the inverse of x
## first it checks if the solution is available in the cache and returns it if TRUE
## if FALSE it caculates the inverse and stores it in the cache
cacheSolve <- function(x, ...) {

## try to get the matrix from the cache
	m <- x$getinverse()

## if the cache is NOT empty return a message followed by said matrix
	if(!is.null(m)){
		message("getting your answer from the cache, time is money my friend")
		return(m)
	}

## if the cache is empty, get the matrix from makeCacheMatrix and calculate the inverse
## return a message that calculation is being done
	message("inverse not in the cache, generating the inverse and storing it in the cache now")
	data <- x$get()
	m <- solve(data, ...)

## store the inverse of said matrix in the cache
	x$setinverse(m)

##return the inversed matrix, not part of the assignment but good for checking expected result
	m
}
