import itertools

f = open('rosalind_lexv.txt', 'r')
alphabet = f.readline()
alphabet = list(alphabet)
alphabet = filter(lambda a: a != '\n', alphabet)
alphabet = filter(lambda a: a != ' ', alphabet)
size = int(f.readline())


'''
alphabet = ["T", "A", "G", "C"]
size = 1
'''

keywords = itertools.product(alphabet, repeat=size)
keywords_list = [''.join(element) for element in keywords]
keywords_list = sorted(keywords_list)
f = open('answer.txt', 'w')
for element in keywords_list:
    f.write(element + '\n')
f.close()


