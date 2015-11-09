module listrowers

import list
import rowers
import bool
import relation
import pair

data listrowers = nil | (::) rowers (listrowers)

|||these examples describe groups of rowers (whiteboard = before lineups are set, v8 = top eight rowers, pairpartners = two rowers in a pair, katysfour = developmental group, kevinsfave = kevin's favorite rowers)

whiteboard: listrowers
whiteboard = nil

v8: listrowers
v8 = r1 :: r2 :: r4 :: r5 :: r9 :: r10 :: r11 :: r12 :: nil

pairpartners1: listrowers
pairpartners1 = r2 :: r12 :: nil

pairpartners2: listrowers
pairpartners2 = r11 :: r4 :: nil

pairpartners3: listrowers
pairpartners3 = r7 :: r8 :: nil

katysfour: listrowers
katysfour = r6 :: r7 :: r8 :: r3 :: nil

kevinsfave: listrowers
kevinsfave = r1 :: r2 :: r3 :: r8 :: r11 :: nil

iskevinsfave1: list bool
iskevinsfave1 = map topeight nil

iskevinsfave2: list bool
iskevinsfave2 = map topeight rall

varsityeight: list rower
varsityeight = filter topeight rall

allsplits: list Nat
allsplits = map pr rall

topeightavg: Nat
topeightavg = list.foldr plus 0 (map pr (filter topeight rall))

--test cases for rowers

n1: String
n1 = name r1

n2: String
n2 = name r2

p1: Nat
p1 = pr r2

p2 : Nat
p2 = pr r3

t1: bool
t1 = topeight r3

t2: bool
t2 = topeight r1
