import nat
import bool
import pair
import serialize

||| A data type to represent the natural numbers.  We use a lower case
||| "n" in the name to distinguish our nat type from Idris's Nat type

{-Here are some examples of some objects (named values) of type nat.-}

-- zero
z: nat
z = O

-- one
o: nat
o = S O

-- two
t: nat
t = S (S O)

-- three
r: nat
r = S t

-- HOMEWORK #5: Make up some examples of your own. Add them below this
-- comment.

--four
u: nat
u = S (S t)

--five
f: nat
f = S u

--six
s: nat
s = S f

-- HOMEWORK #7 Bind x to the result of applying isZero to r. Add your
-- code below this comment.

x: bool
x = isZero r

-- HOMEWORK #9 Bind a, b, c, d, e respectively to the results of
-- applying evenb to O, (S O), (S (S O)), r, and (S r),
-- respectively. Add your code here.

a: bool
a = evenb O

b: bool
b = evenb (S O)

c: bool
c = evenb (S(S O))

d: bool
d = evenb r

e: bool
e = evenb (S r)

--HOMEWORK #10 In English, describe all of the steps involved in
--evaluating the function application expression, evenb (S r). You
--must be able to explain this process to yourself and your friends!
--The idea is that you keep on applying reduction (simplification)
--rules until you get to a value that cannot be reduced further. Write
--your answer by filling in the following block comment.

{-Evaulating evenb (S r) uses the parameter r to evaluate terms that
don't fit previous definitions. Entering evenb r in the Idris repl
returns false as the output, since r would first be equated to
(S(S(O))) which is the first non-defined value in the pattern of
successors. (S(S(O))) is equivalent to 3, which is an odd number and
therefore false. If evenb (S r) is the successor of the previous term,
r, then it is equal to 4, which is even and therefore true. If r is
used for an even value, then (S r) is an odd value and false. evenb r
is the first definition for all underfined terms, and evenb (S r) will
always return the opposite bool value. The previous equation evenb
(S(S n)) = evenb n helps to simplify the values that are used for r,
since having two successors cancels out the switch from even to odd or
vice versa-}

-- HOMEWORK #11 Here's a function that takes a pair of natural numbers
-- (values of type nat) and that returns their sum (as another value
-- of type nat). We give you the function name and type along with the
-- left hand sides of the two rules that you'll need. We've filled in
-- the right hand sides with placeholders. Your task is to replace the
-- right hand sides of the two rules.

-- Here are a few examples of how this function should work, to get
-- you going. We use ==> to mean "reduces to" or "returns"

-- addp (mkPair O O) ==> O
-- addp (mkPair O (S (S O))) ==> S (S O)
-- addp (mkPair (S O) O) ==> S O
-- addp (mkPair (S (S O)) (S (S (S O)))) ==> S (S (S (S (S O))))

-- Completing the first rule should be pretty easy. Just think about
-- the most basic properties of arithmetic. The second rule is more
-- challenging. Go back and study the evenb example. Notice how we
-- used evenb within its own definition! The idea is that we can
-- compute evenb for a big number by returning the result that we get
-- when we apply it to a number that is two less than the number that
-- we started with. You're going to use a similar idea here.

-- HOMEWORK 12 -- Use the REPL to verify that these tests return the
-- expected results

{-
||| a test, expecting O
h1: nat
h1 = addp (mkPair O O)

||| a test, expecting S (S O)
h2: nat
h2 = add (mkPair O (S (S O)))

||| A test, expecting (S O)
h3: nat
h3 = add (mkPair (S O) O)

||| a test, expecting (S (S (S (S (S O)))))
h4: nat
h4 = add (mkPair (S (S O)) (S (S (S O))))

|||test case for multp function
q: nat
q = mult (mkPair (S(S O)) (S(S(S(S(O)))))) -}

|||factorial test
f1: nat
f1 = fact (S(S(S(S(O)))))

f2: nat
f2 = fact O

{-

|||subp test
s1: nat
s1 = sub (mkPair (S(S(S(O)))) O)

s2: nat
s2 = sub (mkPair (S(S(S(S(O))))) (S(S(S(O)))))

|||exp test
e1: nat
e1 = exp (mkPair (S(S(S(S(O))))) O)

e2: nat
e2 = exp (mkPair (S(S(O))) (S(S(S(S(O))))))

|||lep test
l1: bool
l1 = lep (mkPair O (S(S(S(O)))))

l2: bool
l2 = lep (mkPair (S(S(S(O)))) (S(S(O))))

l3: bool
l3 = lep (mkPair (S(S(O))) (S(S(O))))

|||eqp test
q1: bool
q1 = eqp (mkPair (S(O)) (S(O)))

q2: bool
q2 = eqp (mkPair (S(S(O))) (S(O)))

|||gtp test
g1: bool
g1 = gtp (mkPair (S(S(S(O)))) (S(S(O))))

g2: bool
g2 = gtp (mkPair (S(O)) (S(O)))

|||gep test
p1: bool
p1 = gep (mkPair (S(S(S(O)))) (S(O)))

p2: bool
p2 = gep (mkPair (S O) (S O))

p3: bool
p3 = gep (mkPair (S(S(O))) (S(S(S(S(S(O)))))))

|||ltp test
t1: bool
t1 = ltp (mkPair (S O) (S O))

t2: bool
t2 = ltp (mkPair (S(S(O))) (S(O)))

t3: bool
t3 = ltp (mkPair (S(O)) (S(S(S(O)))))

-}
