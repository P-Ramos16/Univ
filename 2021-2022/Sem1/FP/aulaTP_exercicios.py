1-----
# NMEC: 

"""
A sequência de Fibonacci começa com os números 0 e 1.  Depois, cada elemento
consecutivo da sequência obtém-se pela soma dos dois elementos anteriores.
Complete a função genFibonacci(n) para _devolver_ uma lista com os n primeiros
números de Fibonacci.  Por exemplo, se n=6, deve devolver [0, 1, 1, 2, 3, 5].
A função só tem de funcionar para n>=2.

The Fibonacci sequence starts with the numbers 0 and 1. Then each consecutive
element of the sequence is obtained by the sum of the two previous elements.
Complete the genFibonacci(n) function to _return_ a list of the first n
Fibonacci numbers. For example, if n=6, it should return [0, 1, 1, 2, 3, 5].
The function only has to work for n>=2.
"""

def genFibonacci(n):
   assert n >= 2
   result = [0, 1]
   i = 2
   
   while i < n:
      x = result[-1] + result[-2]
      result.append(x)
      i += 1
      
   return result
   # Complete ...

   

# NÃO precisa de invocar a função.  O codecheck trata disso.
# You DO NOT need to call the function.  Codecheck does that for you.




2-----
# ID: 

"""
Imagine que está a fazer palavras cruzadas (em Inglês) e falta-lhe uma
palavra com o padrão "?YS???Y", onde os "?" representam letras por preencher.
Complete este programa para o ajudar a descobrir a palavra.
O programa já inclui instruções para ler uma lista de palavras inglesas a
partir do ficheiro wordlist.txt.
"""

# This function reads words from a file.
def load(fname):
   with open(fname) as f:
      lst = []
      for line in f:
         words = line.strip().split()
         lst.extend(words)
   return lst


""" a)
Complete a função matchesPattern(s, pattern) para devolver
True se s corresponder ao padrão fornecido e False, no caso contrário.
Uma string s corresponde ao padrão se e só se tiver os mesmos carateres
que o padrão nas mesmas posições, exceto onde o padrão tem ?.
Nas posições dos ?, não importa que carateres estão na string s.
A correspondência não deve fazer distinção entre maiúsculas e minúsculas.
"""
def matchesPattern(s, pattern):
   pattern = pattern.lower()
   s = s.lower()
   
   if len(s) == len(pattern):
      for x in range(len(pattern)):
         if s[x] != pattern[x] and pattern[x] != "?":
            return False
            
      return True
      
   return False
   

""" b)
Complete a função filterPattern(lst, pattern) para extrair duma lista de strings
as strings que têm o padrão dado.
Sugestão: use a função matchesPattern para testar cada palavra.
"""
def filterPattern(lst, pattern):
   resultLst = []
   for word in lst:
      if matchesPattern(word, pattern):
         resultLst.append(word)
         
   return resultLst


def main():
   print("a)")
   print( matchesPattern("secret", "s?c??t") )  #-> True
   print( matchesPattern("secreta", "s?c??t") ) #-> False
   print( matchesPattern("socket", "s?c??t") )  #-> True
   print( matchesPattern("soccer", "s?c??t") )  #-> False
   print( matchesPattern("SEcrEt", "?ecr?t") )  #-> True
   print( matchesPattern("SEcrET", "?ecr?t") )  #-> True
   print( matchesPattern("SecrEt", "?ECR?T") )  #-> True

   words = load("wordlist.txt")

   print("b)")
   # Solution to "S?C??T"
   lst = filterPattern(words, "s?c??t")
   print(lst)

   assert isinstance(lst, list),  "result lst should be a list"
   assert "secret" in lst,  "result should contain 'secret'"

   # Solution to "?YS???Y"
   lst = filterPattern(words, "?ys???y")
   print(lst)


# Call main function:
if __name__ == "__main__":
   main()


3------

# Devolve o número de linhas da matriz M.
def matrows(M):
   return len(M)

# Complete para devolver o número de colunas da matriz M.
def matcols(M):
   return len(M[0])

# Complete a função para devolver uma matriz com m×n zeros.
def matzeros(m, n):
   M = b = [x[:] for x in [n * [0]][:] * m]
   return M

def matzerosTEST(m, n):
   M = matzeros(m, n)
   M[0][1] = 1   # should change just 1 element!
   return M

# Complete a função para multiplicar a matriz A pela matriz B.
def matmult(A, B):
   assert matcols(A) == matrows(B)
   C = matzeros(matrows(A), matcols(B))
   
   x = matrows(A)
   y = matcols(B)
   
   for i in range(x):
      for j in range(y):
         C[i][j] = 0 
         for n in range(matcols(A)):
            C[i][j] += A[i][n] * B[n][j]
   
   ...
   return C

def matmultTEST(A, B):
   C = matmult(A, B)
   return A, B, C


4-------

# 

# 
# 

def hondt(votes, numseats):
   quo = [0] * len(votes)
   partseats = [0] * len(votes)
   
   while numseats > 0:
      for part in range(len(votes)):
         quo[part] = votes[part] / (partseats[part] + 1)
             
             
      #maxIndex = quo.index(max(quo))
      
      
      maxIndex = partidoMax(quo, votes)
      

      
      partseats[maxIndex] += 1
      numseats -= 1
   
   return partseats
   
   
def partidoMax(quo, votes):
      #
   maxq = max(quo)
   maxIndexes = [i for i, qi in enumerate(quo) if qi  == maxq]
   
   maxIndex = maxIndexes[0]
   
   for i in maxIndexes:
      if votes[i] < votes[maxIndex]:
         maxIndex = i
   
   return maxIndex
