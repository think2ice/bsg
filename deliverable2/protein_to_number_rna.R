protein <- "MA"
protein <- read.table("C:/Users/manel/Documents/Universidad/MIRI/Q2A/BSG/datasets/rosalind_mrna.txt", quote="\"", comment.char="")
protein <- as.character(protein[1,1])
aminoacid.possibility <- function(chr){
  if (chr == 'I'){return(3)}
  else if (chr == 'L'){return(6)}
  else if (chr == 'V'){return(4)}
  else if (chr == 'F'){return(2)}
  else if (chr == 'M'){return(1)}
  else if (chr == 'C'){return(2)}
  else if (chr == 'A'){return(4)}
  else if (chr == 'G'){return(4)}
  else if (chr == 'P'){return(4)}
  else if (chr == 'T'){return(4)}
  else if (chr == 'S'){return(6)}
  else if (chr == 'Y'){return(2)}
  else if (chr == 'W'){return(1)}
  else if (chr == 'Q'){return(2)}
  else if (chr == 'N'){return(2)}
  else if (chr == 'H'){return(2)}
  else if (chr == 'E'){return(2)}
  else if (chr == 'D'){return(2)}
  else if (chr == 'K'){return(2)}
  else if (chr == 'R'){return(6)}
}
get.diff.rna <- function (protein){
  result <- 1
  for (i in 2:nchar(protein)) {
    result <- result * aminoacid.possibility((substr(protein, i, i)))
    result <- result%%1000000
  }
  result<- 3*result 
  result <- result %%1000000
  
  if (result < 1000000){return(result)}
  else{return(result%%1000000)}
}
(get.diff.rna(protein))