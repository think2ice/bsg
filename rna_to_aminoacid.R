# Set the workspace 
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
# mock data
rna <- 'AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA'
# Using the library Biostrings for the translation
source("https://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)
# check this documentation:
# http://web.mit.edu/~r/current/arch/i386_linux26/lib/R/library/Biostrings/html/translate.html
rna <- RNAString(rna)
translate(rna)
data <- read.table("rosalind_prot.txt", quote="\"", comment.char="")
rna <- data[1,1]
rna <- as.character(rna)
rna <- RNAString(rna)
aminoacid <- translate(rna)
as.character(aminoacid)