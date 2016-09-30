'''
3rd deliberable bsg
Exercise 1
Given: A DNA string s of length at most 1000 nt.
Return: Four integers (separated by spaces) counting the respective number of times that the symbols 'A', 'C', 'G',
and 'T' occur in s.
'''
# dna = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
f = open("rosalind_dna.txt", 'r')
dna = f.readline()
dna = dna.replace("\n", "")
alphabet = ['A', 'C', 'G', 'T']


def create_symbol_dictionary(alphabet):
    symbol_dict = dict()
    for symbol in range(0, len(alphabet)):
        symbol_dict[alphabet[symbol]] = symbol
    return symbol_dict


def count_dna_nucleotides(alphabet, dna):
    result = [0] * len(alphabet)
    symbol_dict = create_symbol_dictionary(alphabet)
    for symbol in dna:
        result[symbol_dict[symbol]] += 1
    return result

result = count_dna_nucleotides(alphabet, dna)
print(*result)

