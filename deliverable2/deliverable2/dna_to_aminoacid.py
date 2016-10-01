import numpy as np


def count(n):
    r = np.identity(n)
    for j in range(1, n-1):
        for i in range(0, j-1):
            r[i, j] = r[i, j-1]
            for k in range(i, j-1):
                r[i, j] = r[i, j] + r[i, k-1] * r[k+1, j-1]
    print(r)
    return r[0, n-1]
print(count(2))
