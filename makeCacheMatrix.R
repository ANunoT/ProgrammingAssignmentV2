makeCacheMatrix <- function (inputMatrix) {
        
        # This looks like a creation of object with four functions. the functions are;
        # setFuntion() sets the working matrix and resets the inverse to NULL
        # getFunction() get the current working matrix
        # setInv() sets and inverse value, argument passed to setInv is copied to the working martix inverse variable\
        # getInv() get the current matrix inverse of the object and it has a "global" scope
        #
        #
        #first element is jsut a constant message that tells the user that the argument passed to the fucntion is not a matrix
        #The matriInv is where the function records the inverset of the matrix 
        
        errMat ="Argument not a matrix"  ## error message if argument is not a matrix
        matriInv <<- NULL
       
        if (!is.matrix(inputMatrix)) return(errMat)  ## check if argument is matrix, if not error out
        
        #creates the setfucntion that sets the matrix we work with from the argument. Also resests the matrix inverse
        
        setFunction <<- function (theMatrix){
                inputMatrix <<- theMatrix
                matriInv <<- NULL
        }
        
        #getFunction () get the current matrix object
        
        getFunction <- function () inputMatrix
        
        # setInv() sets the martrix inverse, if we wanted to set a pre-worked inverse of the matrix object
        
        setInv <- function(theInv) matriInv <<- theInv
        
        #getInv() get the current working inverse. Note that the inverse has either to be set using setInv() or another function that calculates
        # the inverser and stores in the vartiable matriInv. cacheSolve is just one of those functions
        getInv <- function() matriInv
        
        #create a list as output. Being a list of functions that work on a matrix object and its inverse.
        
        list (set = setFunction, get = getFunction, setInv = setInv, getInv = getInv)
}