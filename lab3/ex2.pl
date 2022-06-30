% Simone Gigante 205702

/*
rule(n(e),[n(g),n(e1)]).
rule(n(e1),[t(+),n(g),n(e1)]).
rule(n(e1),[]).
rule(n(g),[n(f),n(g1)]).
rule(n(g1),[t(*),n(f),n(g1)]).
rule(n(g1),[]).
rule(n(f),n(e)).
rule(n(f),t(a)).
rule(n(f),t(b)).
rule(n(f),t(c)).
rule(n(f),t(d)).
*/




/*e([Head | Tail]):- g(Head), e1(Tail).
e1([Head | Tail]):- plus(Head), e(Tail).
e1([]).
g([Head | Tail]):- f(Head), g1(Tail).
g1([Head | Tail]):- star(Head), g(Tail).
g1([]).

plus(+).
star(*).
f(a).
f(b).
f(c).
f(d).
f(X):- e(X).*/


rule(n(e),[n(g),n(e1)]).
rule(n(e1), [t(+),n(e)]).
rule(n(g),[n(f),n(g1)]).
rule(n(g1),[t(*),n(g)]).
rule(n(g1),[]).
rule(n(f),n(e)).
rule(n(f),t(a)).
rule(n(f),t(b)).
rule(n(f),t(c)).
rule(n(f),t(d)).

parse(X,Y):-
    rule(Y, X).

parse([Headx | Tailx],[Heady | Taily]):-
    rule(Heady,X),
    parse([Headx | Tailx], X).

