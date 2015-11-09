module boolTest

import bool
import pair

b1: bool
b1 = true

b2: bool
b2 = true

b3: bool
b3 = false

b4: bool
b4 = not true

b5: bool
b5 = not b1

b6: bool
b6 = not (not b5)

|||test cases for homework functions

a1: bool
a1 = andp (mkPair false false)

a2: bool
a2 = andp (mkPair false true)

a3: bool
a3 = andp (mkPair true true)

o1: bool
o1 = orp (mkPair false false)

o2: bool
o2 = orp (mkPair true true)

o3: bool
o3 = orp (mkPair true false)

n1: bool
n1 = nand (mkPair true true)

n2: bool
n2 = nand (mkPair true false)

n3: bool
n3 = nand (mkPair false false)

x1: bool
x1 = xor (mkPair true false)

x2: bool
x2 = xor (mkPair false false)

x3: bool
x3 = xor (mkPair true true)

|||test cases for exam #1

pand_t_t: bool
pand_t_t = pand true true
--expect true

pand_t_f: bool
pand_t_f = pand true false
--expect false

pand_f_t: bool
pand_f_t = pand false true
--expect false

pand_f_f: bool
pand_f_f = pand false false
--expect false

por_t_t: bool
por_t_t = por true true
--expect true

por_t_f: bool
por_t_f = por true false
--expect true

por_f_t: bool
por_f_t = por false true
--expect true

por_f_f: bool
por_f_f = por false false
--expect false

pxor_t_t: bool
pxor_t_t = pxor true true
--expect false

pxor_t_f: bool
pxor_t_f = pxor true false
--expect true

pxor_f_t: bool
pxor_f_t = pxor false true
--expect true

pxor_f_f: bool
pxor_f_f = pxor false false
--expect false

pnand_t_t: bool
pnand_t_t = pnand true true
--expect false

pnand_t_f: bool
pnand_t_f = pnand true false
--expect true

pnand_f_t: bool
pnand_f_t = pnand false true
--expect true

pnand_f_f: bool
pnand_f_f = pnand false false
--expect true

--Exam Problem #2: There are 16 possible ways to fill in the result column for a truth table for a binary Boolean function, and there are thus exactly 16 such functions, and no more.
