## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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
        setInverse <- function(inv) m_i <- inv
        
        # get cached inverse value
        getInverse <- function() m_i
        
        #wrapper for the object
        list(get = get, set = set,
             getInverse = getInverse, setInverse = setInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
