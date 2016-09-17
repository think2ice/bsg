# Set the workspace 
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
# mock data
dna <- 'AGCCATGTAGCTAACTCAGGTTACATGGGGATGACCCCGCGACTTGGATTAGAGTCTCTTTTGGAATAAGCCTGAATGATCCGAGTAGCATCTCAG'
library(Biostrings)
dna <- DNAString(dna)
# check this documentation:
# http://web.mit.edu/~r/current/arch/i386_linux26/lib/R/library/Biostrings/html/translate.html
aminoacid.sequence <- translate(dna)
as.character(aminoacid.sequence)
