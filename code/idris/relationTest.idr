import relation
import Person
import pair

women: list Person
women = filter gender people

wAges: list Nat
wAges = map age women

years: Nat
years = list.foldr plus 0 wAges

oneLine: Nat
oneLine = list.foldr plus 0 (map age (filter gender people))

years': Nat
years' = query plus 0 age gender people

totalHeight: Nat
--names = "Foo " ++ "Bar"
totalHeight = query plus 0 height gender people

names: String
names = query (++) "" name gender people

years'': Nat
years'' = query2 people gender age plus 0

totalInches'': Nat
totalInches'' = query2 people gender height mult 1

names'': String
names'' = query2 people gender name (++) ""

number: Nat
number = query2 people gender countOne plus 0

aveAge: pair Nat Nat
aveAge = mkPair
           (query2 people gender age plus 0)
           (query2 people gender countOne plus 0)

aveAge': pair Nat Nat
aveAge' = ave_rel people gender age

--other tests

wHeight: list Nat
wHeight = map height women

wtotalHeight: Nat
wtotalHeight = query plus 0 height gender women

waveAge': pair Nat Nat
waveAge' = ave_rel women gender age
