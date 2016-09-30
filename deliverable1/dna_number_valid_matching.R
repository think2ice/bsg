# Set the workspace 
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
count <- function(n){
  R <- diag(n)
  for (j in 2:n) {
    for (i in 1:(j-1)) {
      R[i,j] <- R[i,j-1]
      for (k in i:(j-1)) {
        if (k > 1){
          R[i,j] <- R[i,j] + R[i,k-1] * R[k+1,j-1]
        }
      }
    }
  }
  return(R[1,n])
}
dna <- "AUGCUAGUACGGAGCGAGUCUAGCGAGCGAUGUCGUGAGUACUAUAUAUGCGCAUAAGCCACGU"
#dna <- "A"
n <- nchar(dna)
mat.R <- count(n)
mat.R
  

