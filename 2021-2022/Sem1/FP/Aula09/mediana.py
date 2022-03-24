def med(lst):

    middle = int(len(lst)/2)

    if len(lst) % 2 == 0:
        lst = sorted(lst)
        median = (lst[middle] +  lst[middle - 1]) / 2

    else:
        sorted(lst)
        median = (lst[middle])

    return median    

lst = [1, 54, 564, 123, 3, 1, 3]

print(med(lst))