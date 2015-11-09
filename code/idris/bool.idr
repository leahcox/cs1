module bool
import serialize

data bool = true | false

-- unary functions

id_bool: bool -> bool
id_bool b = b

constFalse: bool -> bool
constFalse _ = false

constTrue: bool -> bool
constTrue _ = true

not: bool -> bool
not true = false
not _ = true

-- higher order functions are functions that take functions 
-- as arguments or that return functions as results

-- partial evaluation means the application of a function
-- that takes several parameters to fewer parameters with
-- a function that takes the remaining parameters as a result

-- binary functions (bool -> (bool -> bool)), explicit

pand: bool -> bool -> bool
pand true = id_bool
pand false = constFalse

por: bool -> bool -> bool
por true = constTrue
por false = id_bool

pxor: bool -> bool -> bool
pxor true = not
pxor false = id_bool

pnand: bool -> bool -> bool
pnand true = not
pnand false = constTrue

-- binary functions (bool -> bool -> bool), implicit

and: bool -> bool -> bool 
and true true = true
and _ _ = false

uf: bool -> bool
uf = (and true)

or: bool -> bool -> bool
or false false = false
or _ _ = true

eql_bool: bool -> bool -> bool
eql_bool true true = true
eql_bool false false = true
eql_bool _ _ = false

instance Serialize bool where
  toString true = "True"
  toString false = "False"
