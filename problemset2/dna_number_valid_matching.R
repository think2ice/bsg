# Set the workspace 
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
dna <- "AUGCUAGUACGGAGCGAGUCUAGCGAGCGAUGUCGUGAGUACUAUAUAUGCGCAUAAGCCACGU"
dna <- "AUG"
n <- nchar(dna)
# r.func <- function(n){
#   if (n == 0 || n == 1|| n == 2){return(1)}
#   sol <- r.func(n-1) 
#   for (j in 1:(n-2)) {
#     sol <- r.func(j-1)*r.func(n-j-1)
#   }
# }
# sol <- r.func(n)
count <- function(n){
  R <- diag(n)
  for (i in 1:n) {
    for (j in 1:n) {
      R[i,j] <- 0
    }
    R[i,i] <- 1
  }
  for (j in 2:n) {
    for (i in 1:(j-1)) {
      R[i,j] <- R[i,j-1]
      for (k in i:(j-1)) {
        print(k)
        print(i)
        # R[i,j] <- R[i,j] + R[i,k-1] * R[k+1,j-1]
      }
    }
  }
  return(R[1,n])
}
mat.R <- count(n)
mat.R
  

