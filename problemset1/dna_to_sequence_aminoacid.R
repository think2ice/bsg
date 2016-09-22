# Set the workspace 
setwd("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets")
# mock data
# dna <- "AGCCATGTAGCTAACTCAGGTTACATGGGGATGACCCCGCGACTTGGATTAGAGTCTCTTTTGGAATAAGCCTGAATGATCCGAGTAGCATCTCAG"
rosalind_orf <- read.csv("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets/rosalind_orf.txt", sep="")
dna <- ""
i <- 1
for (i in 1:nrow(rosalind_orf)) {
  dna <- paste(dna, as.character(rosalind_orf[i,1]), sep = "")
  i <- i+1
}
dna
rna <- gsub("T","U",dna)
library(Biostrings)
rna.reverse <- RNAString(rna)
rna.reverse <- reverseComplement(rna.reverse)
rna.reverse <- as.character(rna.reverse)
find.start.codon <- function(rna){
  i <- 1
  j <- 1
  x <- 1
  while (i < nchar(rna) -1){
    while (i < nchar(rna)-1 && substr(rna ,i,i+2) != "AUG") { # start codon
        i <- i+1
    }
    x[j] <-i
    i <- i+3
    j <- j+1
  }
  return(x)
}
find.stop.codon <- function(rna, ini){
  i <- ini
  while (i < nchar(rna)-1 && substr(rna ,i,i+2) != "UAA"
          && substr(rna ,i,i+2) != "UAG"
          && substr(rna ,i,i+2) != "UGA") { # start codon
      i <- i+3
  }
  return(i-1)
}
start.codon <-find.start.codon(rna)
start.codon.reverse <- find.start.codon(rna.reverse)
j <- 1
stop.codon <- 1
for (i in start.codon) {
  stop.codon[j] <- find.stop.codon(rna, i)
  j <- j+1
}
stop.codon <- stop.codon [stop.codon < nchar(rna)-2]
j <- 1
stop.codon.reverse <- 1
for (i in start.codon.reverse) {
  stop.codon.reverse[j] <- find.stop.codon(rna.reverse, i)
  j <- j+1
}
stop.codon.reverse <- stop.codon.reverse[stop.codon.reverse < nchar(rna)-2]
codon.to.aminoacid <- function (codon) {
  
  if (codon == "GCU") return("A") # Ala
  else if (codon == "GCC") return("A") # Ala
  else if (codon == "GCA") return("A") # Ala
  else if (codon == "GCG") return("A") # Ala
  
  
  else if (codon == "UGU") return("C") # Cys
  else if (codon == "UGC") return("C") # Cys
  
  else if (codon == "GAU") return("D") # Asp Aci
  else if (codon == "GAC") return("D") # Asp Aci
  
  else if (codon == "GAA") return("E") # Glu
  else if (codon == "GAG") return("E") # Glu
  
  else if (codon == "UUU") return("F") # Phe
  else if (codon == "UUC") return("F") # Phe
  
  else if (codon == "GGU") return("G") # Gly
  else if (codon == "GGC") return("G") # Gly
  else if (codon == "GGA") return("G") # Gly
  else if (codon == "GGG") return("G") # Gly
  
  else if (codon == "CAU") return("H") # His
  else if (codon == "CAC") return("H") # His
  
  else if (codon == "AUU") return("I") # Iso
  else if (codon == "AUC") return("I") # Iso
  else if (codon == "AUA") return("I") # Iso
  
  else if (codon == "AAA") return("K") # Lys
  else if (codon == "AAG") return("K") # Lys
  
  else if (codon == "CCU") return("P") # Pro
  else if (codon == "CCC") return("P") # Pro
  else if (codon == "CCA") return("P") # Pro
  else if (codon == "CCG") return("P") # Pro
  
  else if (codon == "UUA") return("L") # Leu
  else if (codon == "UUG") return("L") # Leu
  else if (codon == "CUU") return("L") # Leu
  else if (codon == "CUC") return("L") # Leu
  else if (codon == "CUA") return("L") # Leu
  else if (codon == "CUG") return("L") # Leu
  
  else if (codon == "AAU") return("N") # Asp
  else if (codon == "AAC") return("N") # Asp
  
  else if (codon == "AUG") return("M") # Met
  
  else if (codon == "CAA") return("Q") # Glu
  else if (codon == "CAG") return("Q") # Glu
  
  else if (codon == "CGU") return("R") # Arg
  else if (codon == "CGC") return("R") # Arg
  else if (codon == "CGA") return("R") # Arg
  else if (codon == "CGG") return("R") # Arg
  else if (codon == "AGA") return("R") # Arg
  else if (codon == "AGG") return("R") # Arg
  
  else if (codon == "UCU") return("S") # Ser
  else if (codon == "UCC") return("S") # Ser
  else if (codon == "UCA") return("S") # Ser
  else if (codon == "UCG") return("S") # Ser
  else if (codon == "AGU") return("S") # Ser
  else if (codon == "AGC") return("S") # Ser
  
  else if (codon == "ACU") return("T") # Thr
  else if (codon == "ACC") return("T") # Thr
  else if (codon == "ACA") return("T") # Thr
  else if (codon == "ACG") return("T") # Thr
  
  else if (codon == "GUU") return("V") # Val
  else if (codon == "GUC") return("V") # Val
  else if (codon == "GUA") return("V") # Val
  else if (codon == "GUG") return("V") # Val
  
  else if (codon == "UAU") return("Y") # Tyr
  else if (codon == "UAC") return("Y") # Tyr
  
  else if (codon == "UGG") return("W") # Try
  
  else return("*")
}
codon.seq.to.aminoacid <- function (seq){
  i<- 1
  protein <- ""
  while (i < nchar(seq)){
    protein <- paste(protein, codon.to.aminoacid(substr(seq, i, i+2)), sep = "")
    i <- i +3
  }
  protein <- paste(protein, "\n",sep = "")
  return(protein)
}
rna.to.aminoacid <- function(rna, seq.start, seq.stop){
  int <- min(length(seq.start), length(seq.stop))
  x <- 1
 for (i in 1:int) {
   x[i] <- codon.seq.to.aminoacid(substr(rna, seq.start[i], seq.stop[i]))
 }
  return(x)
}
rna.output <- rna.to.aminoacid(rna, start.codon, stop.codon)
rna.reverse.output <- rna.to.aminoacid(rna.reverse, start.codon.reverse, stop.codon.reverse)
output <- c(rna.output, rna.reverse.output)
cat(unique(output))

