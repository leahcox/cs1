module Box
import eq
import serialize

-- A polymorphic Box type

-- Type constructuor with single type argument

data Box t = mkBox t

unbox: Box t -> t
unbox (mkBox b) = b

-- Typeclass instances / overloaded operators

instance (eq a) => eq (Box a) where
  eql (mkBox v1) (mkBox v2) = eql v1 v2

instance (Serialize a) => Serialize (Box a) where
toString (mkBox b) = "(" ++ (toString b) ++ ",)"
