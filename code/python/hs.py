def hs(n):
    n = int
    t = 0

    while (n != 1):
        print(n)
        t = (t+1)
        if (n % 2 == 0):
            n = n//2
        else:
            n = 3*n + 1

    StopIteration
    print(1)
    print(t)
    return None
