||| A record type that describes three attributes of a rower: name, 2k personal record, and whether or not they are in the top eight of the team.

module rower
import bool
import list
import relation

record rower where
  constructor mkRower
  name : String
  pr : Nat
  topeight : bool

--Values of type rower
r1: rower
r1 = mkRower "Sam" 648 true

r2: rower
r2 = mkRower "Georgia" 656 true

r3: rower
r3 = mkRower "Ellie" 703 false

r4: rower
r4 = mkRower "Ali" 705 true

r5: rower
r5 = mkRower "Erin" 658 true

r6: rower
r6 = mkRower "Maddie" 717 false

r7: rower
r7 = mkRower "Mary Beth" 723 false

r8: rower
r8 = mkRower "Julia" 715 false

r9: rower
r9 = mkRower "Tessa" 702 true

r10: rower
r10 = mkRower "Jo" 706 true

r11: rower
r11 = mkRower "Mack" 659 true

r12: rower
r12 = mkRower "Heidi" 658 true

rall: list rower
rall = r1 :: r2 :: r3 :: r4 :: r5 :: r6 :: r7 :: r8 ::r9 :: r10 :: r11 :: r12 :: nil


