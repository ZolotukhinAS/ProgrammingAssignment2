## Module implements special type of matrix that based on simple matrix that 
## allows caching inversed calculations in first occurance for later reuse

## intialization wrapper for matrix with caching feature
## usage sample:
## m <- makeCacheMatrix()
## m$set(matrix(rnorm(16,50,15),4,4))

makeCacheMatrix <- function(x = matrix()) {
        # storage for cached inversed matrix
        m_i <- NULL
        
        # constructor
        set <- function(y = matrix()){
                x <<- y
                m_i <<- NULL
        }
        
        # return inital matrix itself
        get <- function () x
        
        # set cached inverse value
        setInverse <- function(inv) m_i <<- inv
        
        # get cached inverse value
        getInverse <- function() m_i
        
        #wrapper for the object
        list(get = get, set = set,
             getInverse = getInverse, setInverse = setInverse)
}


## calculates and cache on first usage the inversed matrix. On second and later
## use will not do the calculations anymore but return cached matrix
## usage sample:
## m_i <- cacheSolve(m)
## where m was created by makeCacheMatrix function

cacheSolve <- function(x, ...) {
        
        #get inversed value for matrix
        m_i <- x$getInverse()
        
        # if it was computed before then quit
        if (!is.null(m_i)){
                return (m_i)
        }
        
        # gets here only when not precached
        
        # get "raw" matrix
        m <- x$get()
        
        # get inversed of "raw" matrix
        m_i<- solve(m, ...)
        
        # filling cache with that inversed matrix
        x$setInverse(m_i)
        
        # return inversed matrix
        m_i
}
