# Set the workspace 
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
# transforming a dna into its reverse complement
library(Biostrings)
#dna <- 'AAAACCCGGT'
dna <- read.table("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets/rosalind_revc.txt", quote="\"", comment.char="")
dna <- as.character(dna[1,1])
dna <- DNAString(dna)
dna.reverse <- reverseComplement(dna)
as.character(dna.reverse)
