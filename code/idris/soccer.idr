module soccer

import list
import nat

data team = ManCity | Arsenal | ManUnited | CrystalPalace | LeicesterCity
data soccer = mkSoccer team Nat Nat Nat Nat

|||defines wins, draws, losses, and points

mcity: soccer
mcity = mkSoccer ManCity 6 0 2 18

ars: soccer
ars = mkSoccer Arsenal 5 1 2 16

manu: soccer
manu = mkSoccer ManUnited 5 1 2 16

crys: soccer
crys = mkSoccer CrystalPalace 5 0 3 15

leic: soccer
leic = mkSoccer LeicesterCity 4 3 1 15

stats: list soccer
stats = cons mcity (cons ars (cons manu (cons crys (cons leic nil))))

update: soccer -> Nat -> soccer
update (mkSoccer team a b c d) e = mkSoccer team e b c d
