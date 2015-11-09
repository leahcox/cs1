module list
import nat
import pair
import bool
import ite
import eq
import serialize

infixr 7 ::, ++
data list a = nil | (::) a (list a)

|||polymorphic function to return the length of any given list (may be a list of nats, bools, etc)
length: list a -> nat
length nil = O
length (n::l) = S (length l)

append: list a -> list a -> list a
append nil m = m
append (h::t) m = (h) :: append t m

(++): list a -> list a -> list a
(++) nil l = l
(++) (h::t) l = h::((++) t l)

|||polymorphic map function
map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h) :: (map f t)

|||given a list and a predicate on elements, return the sublist of elements for which the predicate is true
filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h::t) = ite (f h)
                  (h :: (filter f t))
                   (filter f t)


-- b is an accumulator (acc)

foldl: list a -> b -> (a -> b -> b) -> b
foldl nil acc _ = acc
foldl (h::t) acc f = foldl t (f h acc) f

foldr: (a -> a -> a) -> a -> list a -> a
foldr _ acc nil = acc
foldr f acc (h::t) = f h (list.foldr f acc t)

member: (eq a) => a -> list a -> bool
member v nil = false
member v (h::t) = ite (eql v h)
                      true
                      (member v t)

-- typeclass instance

instance (eq a) => eq (list a) where
  eql nil nil = true
  eql (h::t) nil = false
  eql nil (h::t) = false
  eql (h1::t1) (h2::t2) = and (eql h1 h2) (eql t1 t2)

-- comparison of sets and lists

subset_elements: (eq a) => list a -> list a -> bool
subset_elements nil l = true
subset_elements (h::t) l = and (member h l) (subset_elements t l)

same_elements: (eq a) => list a -> list a -> bool
same_elements l1 l2 = and (subset_elements l1 l2) (subset_elements l2 l1)

-- serialization of lists

listString: (Serialize a) => list a -> String
listString nil = ""
listString (h::nil) = (toString h)
listString (h::t) = (toString h) ++ ", " ++ (listString t)

instance (Serialize a) => Serialize (list a) where
  toString (l) = "[" ++ (listString l)  ++ "]"
