module gunrow
import list

data country = Argentina | Australia | Austria | Honduras | USA

|||A record of this type represents a country and the death rate per 1O,OOO,OOO by gun for homicides, suicides, unintentional, other

data gunrow = mkGunrow country Nat Nat Nat Nat

argen: gunrow
argen = mkGunrow Argentina 190 279 64 362

alia: gunrow
alia = mkGunrow Australia 11 62 5 8

stria: gunrow
stria = mkGunrow Austria 18 268 1 8

hond: gunrow
hond = mkGunrow Honduras 648 0 0 0

usa : gunrow
usa = mkGunrow USA 355 670 16 9

countryName: gunrow -> country
countryName (mkGunrow c h s u o) = c

homicidePer1OM: gunrow -> Nat
homicidePer1OM (mkGunrow c h s u o) = h

suicidePer1OM: gunrow -> Nat
suicidePer1OM (mkGunrow c h s u o) = s

unintentionalPer1OM: gunrow -> Nat
unintentionalPer1OM (mkGunrow c h s u o) = u

otherPer1OM: gunrow -> Nat
otherPer1OM (mkGunrow c h s u o) = o

listgunrow: list gunrow
listgunrow = cons argen (cons alia (cons stria (cons hond (cons usa nil))))
