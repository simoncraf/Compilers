%Simone Gigante 205702
/*
Ex 3. Consider a data type “dictionary” intended to provide an efficient representation of a set of
pairs of names with values. Thus, the dictionary dic(Name,Value,Dic1,Dic2) pairs Name with Value,
together with all the pairings provided by subdictionaries Dic1 and Dic2. We assume that the
dictionary is ordered so that the names in Dic1 are before Name, and all in Dic2 are after, and
both Dic1 and Dic2 are themselves ordered. Thus no names can be repeated in an ordered
dictionary. Suppose the ordering is alphabetical order. Ordering relationships may be expressed
using the symbol ‘<’ for the two-place predicate ‘is before’ (for comparing strings you may use
‘@<’) . As an example the following is an alphabetically ordered dictionary pairing Catalan and
*/

/* 
TESTS:
look(mostaza,X) OUTPUT: True, X = moutard
look(vinagre,X) OUTPUT: True, X = vinaigre
look(chorizo,X) OUTPUT: False
look(sal,sel) OUTPUT: True

*/

look(Name, Value) :- dictionary(D), lookup(Name, D, Value).

dictionary(dic(sal, sel,
           dic(mostaza, moutard, void,
           dic(pebre, poivre, void, void)),
           dic(vinagre, vinaigre, void, void))).

lookup(Name, dic(Word, _, Prev, Next), Value) :- 
     Name @> Word, lookup(Name, Next, Value) ; 
     Name @< Word, lookup(Name, Prev, Value).

lookup(Name, dic(Name, Value, _, _), Value).




