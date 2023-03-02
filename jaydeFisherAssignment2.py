#1
U=["a","b","c","d","e","f"]
A=["a","c","e"]
B=["b","c","d","e"]
empty=[]

print(U)

print(empty)

print(A)

Ac=[]
for i in U:
    if i not in A:
        Ac.append(i)
print(Ac)

print(B)

Bc=[]
for i in U:
    if i not in B:
        Bc.append(i)

AnB=[]
for i in A:
    for j in B:
        if i==j:
            if i not in AnB:
                AnB.append(i)
print(AnB)

Aup=set(Ac+Bc)
print(Aup)

AUB=set(A+B)
print(AUB)

Adown=[]
for i in U:
    if i not in A:
        if i not in B:
            Adown.append(i)
print(Adown)

Aright=set(Ac+B)
print(Aright)

Aneg=[]
for i in A:
    if i not in B:
        Aneg.append(i)
print(Aneg)

Bright=set(A+Bc)
print(Bright)

Bneg=[]
for i in B:
    if i not in A:
        Bneg.append(i)
print(Bneg)

AarrowB=[]
for i in Aright:
    for j in Bright:
        if i==j:
            if i not in AarrowB:
                AarrowB.append(i)
print(AarrowB)

AexclusiveB=set(Aneg+Bneg)
print(AexclusiveB)


#2


#3


#4
#The french implies all that are mathmaticians and all that are philosophers, which imply all people who drink coffee but not tea.


#5


#7
A=[1,4,5]
B=[10,3,5]


def powerset(s):
    ps=[[]]
    for i in s:
        ps.append(i)
    ps+=[[s[0],s[1]]]
    ps+=[[s[1],s[2]]]
    ps+=[[s[0],s[2]]]
    ps+=[[s[0],s[1],s[2]]]
    return ps
