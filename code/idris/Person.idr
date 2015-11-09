module Person
import public bool
import public list

||| A record type that is equivalent to:
||| (data Person = mkPerson String nat bool)
||| but where we give names to fields.
||| A person has a name and an age and a height in
||| years, and gender is true if female otherwise false.
record Person where
    constructor mkPerson
    name : String
    age : Nat
    height: Nat
    gender: bool

setName: Person -> String -> Person
setName (mkPerson n a h g) n' = mkPerson n' a h g

p1: Person
p1 = mkPerson "Tommy" 3 63 false

p2: Person
p2 = mkPerson "Anna" 16 70 true

p3: Person
p3 = mkPerson "Kevin" 68 66 false

p4: Person
p4 = mkPerson "Emily" 42 66 true

people: list Person
people = (p1 :: p2 :: p3 :: p4 :: nil)
