##################################################################################
# Peer Assessments / Programming Assignment 2                                    #
#                                                                                #
# Goal: take advantage of the scoping rules of the R language                    #
#       and manipulate them to preserve state inside of an R object.             #
##################################################################################



'*********************************************************************************
Name ......... : makeCacheMatrix
Desc ......... : If the contents of a Matrix are not changing, cache its inverse, for re-use.
                 So the Matrix can be looked up in the cache rather than recomputed.
                 It results in some cases a better time-consuming computation.
Author ....... : GitWaga
Version ...... : V1.0 (24/04/2014)
Licence ...... : GPL

Input ........ : matrix
Output ....... : matrix
**********************************************************************************'


makeCacheMatrix <- function(x = matrix()) 
{
        # inv will store the cached inverse matrix
        inv <- NULL
        
        # Setter for the matrix
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        # Getter for the matrix
        get <- function() x
        
        # Setter for the inverse
        setinv <- function(inverse) inv <<- inverse
        # Getter for the inverse
        getinv <- function() inv
        
        # Return the matrix with our newly defined functions
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}



'*********************************************************************************
Name ......... : cacheSolve
Desc ......... : computes the inverse of a matrix.
                 If the inverse has already been calculated, 
                 then the cachesolve should retrieve the inverse from the cache.
Author ....... : GitWaga
Version ...... : V1.0 (24/04/2014)
Licence ...... : GPL

Input ........ : matrix
Output ....... : matrix
**********************************************************************************'

cacheSolve <- function(x, ...) 
{       
        inv <- x$getinv()
        
        # If the inverse is already calculated, return it
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        
        # The inverse is not yet calculated, so we calculate it
        data <- x$get()
        inv <- solve(data, ...)
        
        # Cache the inverse
        x$setinv(inv)
        
        # Return it
        inv
}
