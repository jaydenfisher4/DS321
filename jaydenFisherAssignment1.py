#non recursive insert function

def insert(num,tree):
    oldtree=tree
    newtree=None

    while not isEmpty(tree):
        newtree=oldtree
        if oldtree.value > num:
            oldtree=newtree.left
        else:
            oldtree=newtree.right

    if newtree==None:
        newtree=makeTree(num, emptyTree(), emptyTree())

    elif newtree.value > num:
        newtree.left=makeTree(num, emptyTree(), emptyTree())

    else:
        newtree.right=makeTree(num, emptyTree(), emptyTree())

    return newtree


#non recursive mergesort (used stack overflow for help)

def mergesort(A):
    x = 1    
    n = len(A)                                          
    while (x < n):
        left=0;
        while (left < n): 
            right = min(left+(x*2-1), n-1)         
            middle = min(left+x-1,n-1)           
            merge(A, left, middle, right)
            left += x*2
        x *= 2
    return A
    
def merge(A, left, middle, right): 
    n1 = middle - left + 1
    n2 = right - middle 
    L = [0] * n1 
    R = [0] * n2 
    for i in range(0, n1): 
        L[i] = A[left + i] 
    for i in range(0, n2): 
        R[i] = A[middle + i + 1] 
  
    i, j, k = 0, 0, left 
    while i < n1 and j < n2: 
        if L[i] <= R[j]: 
            A[k] = L[i] 
            i += 1
        else: 
            A[k] = R[j] 
            j += 1
        k += 1
    while i < n1: 
        A[k] = L[i] 
        i += 1
        k += 1
    while j < n2: 
        A[k] = R[j] 
        j += 1
        k+=1

#frequency count

def frequencyCount(A):
    A=mergesort(A)
    newlist=[]
    used=[]
    x=-1
    for i in A:
        if i not in used:
            used.append(i)
            newlist.append([i,1])
            x+=1
        else:
            newlist[x[1]]+=1
    return newlist

#descendant and ancestor

def Descendant(element, tree):
    descendants = [element]
    root=tree
    if isInTree(element, tree):
        while root.value!=element:
            if element>root.value:
                root=root.right
            else:
                root=root.left
        descendants+=inOrderTravesal(root)
    return descendants

def Ancsestor(element, tree):
    ancsestors = []
    root=tree
    if isInTree(element, tree):
        while root.value!=element:
            ancsestors.append(root.value)
            if element>root.value:
                root=root.right
            else:
                root=root.left
    return ancsestors



#intersect, difference, and equal set

def Intersect(A,B):
    newlist=[]
    A=mergesort(A)
    B=mergesort(B)
    for i in A:
        for j in B:
            if i==j:
                if i not in newlist:
                    newlist.append(i)
    return newlist

def Difference(A,B):
    newlist=[]
    A=mergesort(A)
    B=mergesort(B)
    for i in A:
        for j in B:
            if i!=j:
                if i not in newlist:
                    newlist.append(i)
    return newlist

def equalSet(A,B):
    A=mergesort(A)
    B=mergesort(B)
    if A==B:
        return True
    else:
        return False


#isIn, Insert, Delete

def isIn(element, A):
    p=3
    hash= makeHash(A,p)
    if isEmpty(hash):
        return False
    else:
        if element in dict[element%p]:
            return True

def Insert(element, A):
    p=3
    hash= makeHash(A,p)
    if element%p in hash.keys:
        hash[element%p].append(element)
    else:
        hash[element%p]=[element]
    return hash

def Delete(element, A):
    if isIn(element, A):
        p=3
        hash= makeHash(A,p)
        hash[element%p]-= element
    return hash


#freq count with hash

def frequencyCount2(A):
    p=7
    hash=makeHash(A,p)


#code from lecture for tree
def emptyTree():
    return {}

def makeTree(value,left,right):
    return {'value':value, 'left': left, 'right': right}


def leaf(value):
    return makeTree(value,emptyTree(),emptyTree())


def root(tree):
    return tree['value']


def left(tree):
    return tree['left']


def right(tree):
    return tree['right']

def isEmpty(tree):
    if tree == {}: return True
    else: return False

def isInTree(element, tree):
   if isEmpty(tree):  return False
   if element == root(tree): return True
   if element < root(tree):  return isIn(element,left(tree))
   else: return isIn(element,right(tree))

def inOrderTravesal(tree):
    if ( not isEmpty(tree) ):
        inOrderTravesal(left(tree))
        print(root(tree))
        inOrderTravesal(right(tree))

#code from lecture for merge sort
def leftHalf(A):
   return A[:len(A)//2]

def rightHalf(A):
   return A[len(A)//2:]

#making hash
def makeHash(lst, p):
    dict={}
    for i in lst:
        if i%p in dict.keys:
            dict[i%p].append(i)
        else:
            dict[i%p]=[i]