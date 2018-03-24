
# Alberto Nuno Teixeira
# 23/03/2018
# Prograging in R, Week 3 Assignment 2, Data Science Speciliasation @coursera
#This fucntion uses the functions inside the list provided by the makeCacheMatrix(). x is the list output of the makeCacheMatrix
#This fucntion returns the inverse of a matrix, if the object passed has already a matrix defined then the the fucntion will return the exiting 
#inverse that is cached in the list object.

cacheSolve <- function(x, ...) { 

#get the value of existing inverse. If it is not NULL then the inverve has been calculated for the matrix, thus return it. Otherwise, calculate
#the inverse and return it. It avoids re-calculating inverses that can be resource intensive. the matriInv is a variable that holds the inverse
#value and has a upper level scope. As the variable is not defined in this function, the R compiler automatically climbs into the next environment
#until it finds the variable definition.
        
         matriInv <- x$getInv()  
        if (!is.null(matriInv)) { 
                message("Getting cached data")
                return(matriInv)
        }
         
#At this stage the inverse has not been solved, get the matrix using the get() function of the list returned by makeCacheMatrix().
# Calculate the inverse using solve() and place result in matriInv. Then set the matriInv in the list object and resturn the inverse.
         
        data <- x$get()
        matriInv <- solve(data, ...)
        x$setInv(matriInv)
        matriInv
}
