import itertools


def gen_perm(alphabet, size):
    keywords = itertools.product(alphabet, repeat=size)
    keywords_list = [''.join(element) for element in keywords]
    return keywords_list


def n_perm(alphabet, n):
    output = []
    for i in range(1, n+1):
        output = output + gen_perm(alphabet, i)
    return output
'''alphabet = ["T", "A", "G", "C"]
n = 3 '''
f = open('rosalind_lexv.txt', 'r')
alphabet = f.readline()
alphabet = list(alphabet)
alphabet = filter(lambda a: a != '\n', alphabet)
alphabet = filter(lambda a: a != ' ', alphabet)
n = int(f.readline())
word_list = n_perm(alphabet, n)
word_list_ordered = sorted(word_list, key=lambda word: [alphabet.index(c) for c in word])
f = open('answer.txt', 'w')
for element in word_list_ordered:
    f.write(element + '\n')
f.close()