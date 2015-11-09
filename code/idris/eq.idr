module eq

import public bool

{-
A typeclass is a sort of record type constructor. An "instance" can be  provided for any given type. To construct a record instance for a given type, one must provide a value for the fields of that record. The eq typcelss that we define here has just one field, namely "eql". In this way, many different types have associated "eql" functions. When code uses eql, Idris uses type inference to figure out which instance to look in to find the particular function implementation to use.
-}

class eq a where
  eql : a -> a -> bool

{-
We define an instance of the eq typeclass for the bool type here. We do this here for two reasons. first, it makes for a nice example in context. Second, and more importantly, we can't write this instance in bool.idr, because then we'd have to have bool.idr import from this file, while this file imports from bool.idr.
-}

instance eq bool where
  eql b1 b2 = eql_bool b1 b2
