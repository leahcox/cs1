import list
import bool
import nat

|||test cases for length

la: list Nat
la = 1::2::3::nil

le1: Nat
le1 = length nil {a=nat}

le2: Nat
le2 = length (1 :: la)

li: list bool
li = true :: false :: true :: true :: nil

l1: list Nat
l1 = nil

l2: list Nat
l2 = (::) 1 l1

l3: list Nat
l3 = (::) 2 l2

--old code for append instead of ++ notation

append: list a -> list a -> list a
append nil l2 = l2
append (h::l1) l2 = h :: (append l1 l2)


|||test cases for list map function

--m0: list a
--m0 = map (add 1) l3

--m1: list a
--m1 = map (add 1) l1

labtest1: list bool
labtest1 = map evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)

labtest2: list nat
labtest2 = filter evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)

|||test cases for serialization of lists

n: list a
n = nil

