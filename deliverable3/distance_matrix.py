# coding=utf-8
'''
For two strings s1 and s2 of equal length, the p-distance between them,
denoted dp(s1,s2), is the proportion of corresponding symbols that differ between s1 and s2.
For a general distance function d
on n taxa s1,s2,…,sn (taxa are often represented by genetic strings), we may encode the
distances between pairs of taxa via a distance matrix D in which Di,j=d(si,sj).
Given: A collection of n(n≤10) DNA strings s1,…,sn of equal length (at most 1 kbp). Strings are given in FASTA format.
Return: The matrix D
corresponding to the p-distance dp on the given strings. As always, note that your answer
is allowed an absolute error of 0.001.
'''
from kmer_composition import fasta_iter
import numpy as np


def hamming_dist_2dna(dna1, dna2):
    dist = float(0)
    for ch1, ch2 in zip(dna1, dna2):
        if ch1 != ch2:
            dist += 1
    return dist/len(dna1)


def hamming_matrix(dna_dict):
    m = len(dna_dict.keys())
    hamming_matrix = np.zeros((m, m))
    i = 0
    k = 1
    for key1 in dna_dict.keys():
        j = k
        dna1 = dna_dict.pop(key1)
        for key2 in dna_dict.keys():
            hamming_matrix[i, j] = hamming_dist_2dna(dna1, dna_dict[key2])
            hamming_matrix[j, i] = hamming_matrix[i, j]
            j += 1
        i += 1
        k += 1
    return hamming_matrix

dna_dict = fasta_iter("fasta_example.txt")
# print hamming_matrix(dna_dict)
np.savetxt('answer.txt', hamming_matrix(dna_dict), fmt='%10.5f')
# print(re.sub('[\[\]]', '', np.array_str(hamming_matrix(dna_dict))))
'''dna1 = 'AATTC'
dna2 = 'ATATC'
print hamming_dist_2dna(dna1, dna2)'''



