module dna
import public list
import public pair
import public ite
import public bool

data base = G | C | A | T

ATpair: pair base base
ATpair = mkPair A T

TApair: pair base base
TApair = mkPair T A

CGpair: pair base base
CGpair = mkPair C G

GCpair: pair base base
GCpair = mkPair G C

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base C = G
complement_base G = C

complement_strand: list base  -> list base
complement_strand a = map complement_base a

strand1: list (pair base base) -> list base
strand1 l = map fst l

strand2: list (pair base base) -> list base
strand2 l = map snd l

fix: base -> pair base base
fix a = mkPair a (complement_base a)

complete: list base -> list (pair base base)
complete nil = nil
complete l = map fix l

complete': list base -> list (pair base base)
complete' nil = nil
complete' (h::t) = mkPair h (complement_base h) :: complete' t

{- countBase: list base -> A -> Nat
countBase nil A = 0
countBase l A = _____

ite isA 1 0

-}

-- add this to the length
--that's how you use fold

isA: base -> bool
isA A = true
isA _ = false

{- also,  why can't we just use filter and then length of that list? -}
