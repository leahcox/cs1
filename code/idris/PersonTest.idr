import Person
import list

-- An example value of type Person
p1: Person
p1 = mkPerson "Tommy" 3 63 false

-- And now here's the key idea: The
-- names of the fields are automatically
-- names of projection functions! Here
-- we get out the age of person, p.
t: Nat
t = age p1
-- expect 3

-- Here we get the name of person p.
n: String
n = name p1
-- expect "Tommy"

p2: Person
p2 = mkPerson "Anna" 16 70 true

p3: Person
p3 = mkPerson "Kevin" 68 66 false

people: list Person
people = (p1 :: p2 :: p3 :: nil)

mapAge: list Person -> list Nat
mapAge nil = nil
mapAge (h::t) = (age h) :: (mapAge t)
