module unit
import bool
import eq
import serialize

data unit = mkUnit

unit_id: unit -> unit
unit_id mkUnit = mkUnit

eql_unit: unit -> unit -> bool
eql_unit u1 u2 = true

instance eq unit where
  eql u1 u2 = true

instance Serialize unit where
  toString u = "()"
