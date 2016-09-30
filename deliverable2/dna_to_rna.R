# Get the data
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
dna <- "GATGGAACTTGACTACGTAAATT"
rna <- gsub("T","U",dna)
dna <- read.csv("rosalind_rna.txt", sep="",header = F)
dim(dna)
rna <- gsub("T","U",dna[1,1])
