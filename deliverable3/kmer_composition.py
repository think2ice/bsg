'''
For a fixed positive integer k, order all possible k-mers taken from an underlying alphabet lexicographically.
Then the k-mer composition of a string scan be represented by an array A for which A[m] denotes the number
of times that the mth k-mer (with respect to the lexicographic order) appears in s.
Given: A DNA string s in FASTA format (having length at most 100 kbp).
Return: The 4-mer composition of s.
'''
import itertools


def gen_perm(alphabet, size):
    keywords = itertools.product(alphabet, repeat=size)
    keywords_list = [''.join(element) for element in keywords]
    return keywords_list


def count_words(word_list, size, dna):
    kmers_dict = list_to_dictionary(word_list)
    for i in range(0, len(dna)-size+1):
        # print 'iter ' + str(i)
        kmers_dict[dna[i:(i+size)]] += 1
    return kmers_dict


def list_to_dictionary(li):
    di = dict()
    for item in li:
        di[item] = 0
    return di


def fasta_iter(fasta_name):
    """
    given a fasta file. yield tuples of header, sequence
    """
    fh = open(fasta_name)
    # ditch the boolean (x[0]) and just keep the header or sequence since
    # we know they alternate.
    faiter = (x[1] for x in itertools.groupby(fh, lambda line: line[0] == ">"))
    sequences = {}
    for header in faiter:
        # drop the ">"
        header = next(header)[1:].strip()
        # join all sequence lines to one.
        seq = "".join(s.strip() for s in next(faiter))
        sequences[header] = seq
        # yield header, seq
    return sequences
'''
dna = 'CTTCGAAAGTTTGGGCCGAGTCTTACAGTCGGTCTTGAAGCAAAGTAACGAACTCCACGGCCCTGACTACCGAAC' \
      'CAGTTGTGAGTACTCAACTGGGTGAGAGTGCAGTCCCTATTGAGTTTCCGAGACTCACCGGGATTTTCGATCCAGCCTCAGTCCAG' \
      'TCTTGTGGCCAACTCACCAAATGACGTTGGAATATCCCTGTCTAGCTCACGCAGTACTTAGTAAGAGGTCGCTGCAGCGGGGCAAGGAGA' \
      'TCGGAAAATGTGCTCTATATGCGACTAAAGCTCCTAACTTACACGTAGACTTGCCCGTGTTAAAAACTCGGCTCACATGCTGTCTGCGGCTGG' \
      'CTGTATACAGTATCTACCTAATACCCTTCAGTTCGCCGCACAAAAGCTGGGAGTTACCGCGGAAATCACAG'
'''
data = fasta_iter("rosalind_kmer.txt")
dna = data.values()[0]
alphabet = ["T", "A", "G", "C"]
size = 4
word_list = gen_perm(alphabet, size)
kmers_dict = count_words(word_list, size, dna)
# print (sorted(kmers_dict.keys()))
f = open('answer.txt', 'w')
for key in sorted(kmers_dict.keys()):
    f.write(str(kmers_dict[key]) +' ')
f.close()
# print (list_to_dictionary(word_list))