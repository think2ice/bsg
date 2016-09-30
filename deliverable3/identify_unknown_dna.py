'''
3rd deliberable bsg
Exercise 2
Given: At most 10 DNA strings in FASTA format (of length at most 1 kbp each).
Return: The ID of the string having the highest GC-content, followed by the GC-content of that string.
Rosalind allows for a default error of 0.001 in all decimal answers unless otherwise stated;
please see the note on absolute error below.
'''
from itertools import groupby


def check_symbol(alphabet, symbol):
    if symbol in alphabet:
        return True
    return False


def count_symbols(alphabet, dna):
    result = 0
    for symbol in dna:
        if check_symbol(alphabet, symbol):
            result += 1
    return 100*result/len(dna)


def fasta_iter(fasta_name):
    """
    given a fasta file. yield tuples of header, sequence
    """
    fh = open(fasta_name)
    # ditch the boolean (x[0]) and just keep the header or sequence since
    # we know they alternate.
    faiter = (x[1] for x in groupby(fh, lambda line: line[0] == ">"))
    sequences = []
    for header in faiter:
        # drop the ">"
        header = next(header)[1:].strip()
        # join all sequence lines to one.
        seq = "".join(s.strip() for s in next(faiter))
        sequences.append({header: seq})
        # yield header, seq
    return sequences


def counting_gc_fasta(alphabet, fasta):
    answer = open("answer.txt", 'w')
    result = float(0)
    seq_name =""
    for item in fasta:
        for key in item.keys():
            aux = count_symbols(alphabet, item[key])
            if aux > result:
                result = aux
                seq_name = key

    answer.write(seq_name + '\n')
    answer.write(str(result))

# dna = 'CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGACTGGGAACCTGCGGGCAGTAGGTGGAAT'
alphabet = ['C', 'G']
# print(count_symbols(alphabet, dna))
fasta = fasta_iter("rosalind_gc.txt")
# fasta = fasta_iter("fasta_example.txt")
counting_gc_fasta(alphabet, fasta)
