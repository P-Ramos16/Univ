import os

def printDirFiles(d):
    lst = os.listdir(d)
    for fname in lst:
        path = os.path.join(d, fname)
        if os.path.isfile(path):
            ftype = "FILE"
        elif os.path.isdir(path):
            ftype = "DIR"
        else:
            ftype = "?"
        print(ftype, path)
    return


def findFiles(path, ext):
    files = []
    for fname in os.listdir(path):
        fname = os.path.join(path, fname)
        if os.path.isfile(fname):
            if os.path.splitext(fname)[1] == ext:
                print("File >", fname)
                files.append(fname)

        elif os.path.isdir(fname):
            findFiles(fname, ext)

        else:
            print("?")

    return [x for x in files]



 
    


def main():
    print("Testing printDirFiles('..'):")
    printDirFiles("..")

    print("\nTesting findFiles('.', '.py'):")
    lst = findFiles(".", ".py")
    print(lst)
    assert isinstance(lst, list)

    print("\nTesting findFiles('..', '.py'):")
    lst = findFiles("..", ".py")
    print(lst)

if __name__ == "__main__":
    main()

