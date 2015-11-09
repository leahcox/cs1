import set_adt
import bool
import option
import pair
import list
import nat
import eq
import serialize

s0: set nat
s0 = mkSet nil

s1 : set bool
s1 = mkSet nil

--test case for isEmpty

--expect true
a1: bool
a1 = isEmpty (s1)

--expect false
a2: bool
a2 = isEmpty (mkSet (S(S O) :: (S O) :: O :: nil))

--test case for set_insert

--expect (mkSet true::false::nil)
b1: set bool
b1 = set_insert false (mkSet (true::false::nil))

--expect (mkSet false::true::nil)
b2: set bool
b2 = set_insert false (mkSet (true::nil))

--test case for list_remove

--expect nil
c1: list bool
c1 = list_remove true (nil)

--expect false::nil
c2: list bool
c2 = list_remove true (false::nil)

--expect false::true::nil
c3: list bool
c3 = list_remove true (true::false::true::nil)

--expect true::true::nil
c4: list bool
c4 = list_remove false (true::false::true::nil)

--test case for set_remove

--expect mkSet (false::true::nil)
d1: set bool
d1 = set_remove true (mkSet (true::false::true::nil))

--test case for set_cardinality

--expect O
e1: nat
e1 = set_cardinality (s0)

--expect (S(S O))
e2: nat
e2 = set_cardinality (mkSet (true::false::nil))

--test case for set_member

--expect true
f1: bool
f1 = set_member true (mkSet (true::false::true::nil))

--expect false
f2: bool
f2 = set_member true (s1)

-- test case for combine

--expect nil
g1: list bool
g1 = combine nil nil

--expect true::false::nil
g2: list bool
g2 = combine (true::false::nil) (nil)

--expect true::false::nil
g3: list bool
g3 = combine (true::nil) (false::nil)

--expect true::false::true::nil
g4: list bool
g4 = combine (false::nil) (true::false::true::nil)

--test case for set_union

--expect mkSet(true::false::nil)
h1: set bool
h1 = set_union (mkSet (true::nil)) (mkSet (false::nil))

--test case for intersect

--expect nil
i1: list bool
i1 = intersect nil (true::false::nil)

--expect true::false::nil
i2: list bool
i2 = intersect (true::false::false::nil) (true::false::nil)

--test case for set_intersection

--expect mkSet (true::false::nil)
j1: set bool
j1 = set_intersection (mkSet (true::false::false::nil)) (mkSet (true::false::nil))

--test case for list_difference

--expect nil
k1: list bool
k1 = list_difference nil (true::false::nil)

--expect (true::false::nil)
k2: list bool
k2 = list_difference (true::false::nil) nil

--expect true::nil
k3: list bool
k3 = list_difference (false::true::true::nil) (true::false::nil)

--test case for set_difference

l1: set bool
l1 = set_difference (mkSet (false::true::true::nil)) (mkSet (true::false::nil))

--test case for set_forall

--expect false
m1: bool
m1 = set_forall evenb (mkSet ((S(S(S(S O))))::(S(S(S O)))::(S O)::nil))

--expect true
m2: bool
m2 = set_forall evenb (mkSet ((S(S(S(S O))))::(S(S O))::nil))

--test case for set_exists

--expect true
n1: bool
n1 = set_exists evenb (mkSet ((S(S(S(S O))))::(S(S(S O)))::(S O)::nil))

--expect false
n2: bool
n2 = set_exists evenb (mkSet ((S(S(S O)))::(S O)::nil))

--test case for list_witness

--expect none
o1: option nat
o1 = list_witness evenb nil

--expect none
o2: option nat
o2 = list_witness evenb ((S(S(S O)))::(S O)::nil)

--expect some (S(S(S(S O))))
o3: option nat
o3 = list_witness evenb ((S(S(S(S O))))::(S(S(S O)))::(S O)::nil)

--expect some (S(S O))
o4: option nat
o4 = list_witness evenb ((S(S O))::(S(S(S(S O))))::(S(S(S O)))::(S O)::nil)


-- test case for set_witness

--expect none
p1: option nat
p1 = set_witness evenb (mkSet ((S(S(S O)))::(S O)::nil))

--expect some (S(S(S(S O))))
p2: option nat
p2 = set_witness evenb (mkSet ((S(S(S(S O))))::(S(S(S O)))::(S O)::nil))

--test case for pairelt

--expect nil
q1: list (pair nat nat)
q1 = pairelt (S O) nil

--expect (((S O) (S(S(S O))))::((S O) (S(S O)))::((S O) nil))
q2: list (pair nat nat)
q2 = pairelt (S O) ((S(S(S O)))::(S(S O))::nil)

--test case for pairlist

--expect nil
r1: list (pair nat nat)
r1 = pairlist nil ((S(S(S O)))::(S(S O))::nil)

--expect ((S(S O)) (S(S(S O)))::(S(S O)) nil::(S O) (S(S(S O)))::(S O)
  --nil :: nil (S(S(S O))) :: nil nil)
r2: list (pair nat nat)
r2 = pairlist ((S(S O))::(S O)::nil) ((S(S(S O)))::nil)

--test case for set_product

--expect mkSet ((S(S O)) (S(S(S O)))::(S(S O)) nil::(S O) (S(S(S O)))::(S O)
  --nil :: nil (S(S(S O))) :: nil nil)
t1: set (pair nat nat)
t1 = set_product (mkSet ((S(S O))::(S O)::nil)) (mkSet ((S(S(S O)))::nil))

--test case for list_powerset

--expect nil
u1: list nat
u1 = list_powerset nil

--expect {(S(S(S O))), (S O)}, {(S O), nil}, {((S(S(S O)))::(S
  --O)::nil)}, {(S(S(S O)))}, {(S O)}, {nil}, {(S(S(S O))), nil}
u2: list nat
u2 = list_powerset ((S(S(S O)))::(S O)::nil)

--test case for set_powerset

--expect mkSet (nil)
v1: set (set nat)
v1 = set_powerset (mkSet nil)

--expect mkSet {(S(S(S O))), (S O)}, {(S O), nil}, {((S(S(S O)))::(S
  --O)::nil)}, {(S(S(S O)))}, {(S O)}, {nil}, {(S(S(S O))), nil}
v2: set (set nat)
v2 = set_powerset (mkSet ((S(S(S O)))::(S O)::nil))

--test case for set_eq

--expect true
w1: bool
w1 = set_eql (s1) (s1)

--expect true
w2: bool
w2 = set_eql (mkSet (true::false::nil)) (mkSet (true::false::nil))

--expect true
w3: bool
w3 = set_eql (mkSet (true::false::nil)) (mkSet (false::true::nil))

--expect false
w4: bool
w4 = set_eql (mkSet (true::nil)) (mkSet (false::nil))

--test case for setString

s2: list bool
s2 = nil

--expect ""
x1: String
x1 = setString (mkSet (s2))

--expect true, false, nil
x2: String
x2 = setString (mkSet (true::false::nil))

--test case for set_toString

--expect {true, false, nil}
y1: String
y1 = set_toString (mkSet (true::false::nil))
