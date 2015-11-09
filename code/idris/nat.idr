module nat

import bool
import pair
import eq
import serialize

data nat = O | S nat

||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

||| returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

||| return true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

|||return true if the argument is odd; otherwise false
oddb: nat -> bool
oddb n = not (evenb n)

||| given a pair of natural numbers, return its sum
add: nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

||| given a pair of natural numbers, return its sum
mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

|||factorial function
fact: nat -> nat
fact O = S(O)
fact (S n) = mult (fact n) (S n)

--given a pair of natural numbers, (a,b), return a-b. if a <= b, the answer will be O.
sub: nat -> nat -> nat
sub O n = O
sub n O = n
sub (S n) (S m) = sub n m

-- given a pair of natural numbers, (x, n), return the value of x raised to the nth power
exp: nat -> nat -> nat
exp x O = S(O)
exp x (S n) = mult (exp x n) x

-- given a pair of natural numbers, (a, b), return true if a is less than or equal to b, otherwise return false
le: nat -> nat -> bool
le O O = true
le O (S a) = true
le (S a) (S b) = le a b
le _ _ = false

-- given a pair of natural numbers, (a, b), return true if a is equal to b, otherwise return false
eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat _ _ = false
eql_nat (S a) (S b) = eql_nat a b

-- given a pair of natural numbers, (a, b), return true if a is greater than b, otherwise return false
gt: nat -> nat -> bool
gt (S a) (S b) = not (le a b)

-- given a pair of natural numbers, (a, b), return true if a is greater than or equal to b
ge: nat -> nat -> bool
ge O O = true
ge (S a) O = true
ge O (S a) = false
ge (S a) (S b) = ge a b

-- given a pair of natural numbers, (a, b), return true if a is less than b
ltp: nat -> nat -> bool
ltp a b = not (ge a b)

fib: nat -> nat
fib O = O
fib (S O) = (S O)
fib (S (S n)) = add (fib (S n)) (fib n)

instance eq nat where
  eql n1 n2 = eql_nat n1 n2

instance Serialize nat where
  toString O = "Z"
  toString (S n) = "|" ++ (toString n)
