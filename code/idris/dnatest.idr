import dna

--test case for complement base function
c1: base
c1 = complement_base T

--test case for complement strand function

str1: list base
str1 = A :: T :: T :: A :: nil

str1': list base
str1' = complement_strand str1

--test case for first strand

str2: list (pair base base)
str2 = ATpair :: TApair :: CGpair :: CGpair :: ATpair :: nil

str2': list base
str2' = strand1 str2

--test case for second strand

str2'': list base
str2'' = strand2 str2

--test case for complete' function

cmp: list (pair base base)
cmp = complete' str1


--test case for fix

fix1: pair base base
fix1 = fix T

--test case for complete

comp1: list (pair base base)
comp1 = complete str1
