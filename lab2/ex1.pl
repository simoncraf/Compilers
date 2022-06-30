/*
E -> G E1
E1 -> + G E1 | e
G -> F G1
G1 -> *F G1 | e
F -> (E) | a | b | c | d

f(E).


rule(n(e)) :- g , e1.
rule(n(e1), [t(+),n(g),n(e1)]).
rule(n(g)) :- f, g1.
rule(n(g1)) :- *,f,g1.

*/
%rules:

/*
APARTADO A
El lenguaje generado por la gramatica sera el de 
los terminos (a,b,c,d) sumandose y multiplicandose entre si
*/



e([Head | Tail]):- g(Head), e1(Tail).

e1([Head | Tail]) :- plus(Head), e1_tail(Tail).
e1(X):- [].
e1_tail([Head | Tail]):- g(Head), e1(Tail).
plus(+).

g([Head | Tail]) :- f(Head), g1(Tail).

g1([Head | Tail]) :- star(Head), g(Tail).
g1(X):- [].
star(*).

f(a).
f(b).
f(c).
f(d).
f([Head | Tail]):- g(Head), Tail(e1).