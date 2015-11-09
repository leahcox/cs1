import set
import eq
import nat
import list

s0: set nat
s0 = new_set

s1: set nat
s1 = set_insert (S O) s0

s2: set nat
s2 = set_insert (S O) s1

-- testing eql_set function

{-

t1: bool
t1 = eql_set (mkSet nil) (mkSet nil)


t2: bool
t2 = eql_set (mkSet nil) (mkSet S(S O) :: (S O) :: O :: nil)

t3: bool
t3:  eql_set (mkSet ) (mkSet )

-}
