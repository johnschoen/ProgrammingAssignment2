## makeCacheVector creates a list of functions to help speed the common task of matrix inversion.

## Here are the functions:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix using R's solve() function
## get the value of the inverse matrix using R's solve() function

makeCacheMatrix <- function(x = matrix()) {

## Create an empty matrix and alert the user that it's a placeholder
  m <- "The inverse matrix has not yet been created" 
  set <- function(y) { 
    x <<- y
    m <<- NULL

## Here are the four basic functions

  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Now we create a function to calculate the inverse of the matrix we've created. 

cacheSolve <- function(x, ...) {

## We start by checking to see if the inverse matrix has been created.
## If it has, we return that matrix and the function is completed. 

  m <- x$getinverse()
  if(!is.null(m)) {
    message("Getting cached data ...")
    return(m)
  }

## If the inverse hasn't been calculated, this part of the function does so and then returns the result.

  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

## Now let's test the two functions to see if they work
## Start with a simple, invertible matrix called x

x <- cbind(c(1, 2), c(3, 4)) 

## Check to make sure its a matrix

class(x) 

## Let's see what our matrix looks like

print(x)


## Now create a second matrix to test the cache function ...

cachex <- makeCacheMatrix(x) 

## ... and test our functions.

## Get the original matrix
cachex$get() 

## if the inverse matrix has been created, alert the user
cachex$getinverse() 

## Calcluate the inverse matrix using the R solve function
cachex$setinverse(solve(x))

## Now print the cached inverse matrix
cachex$getinverse() 
