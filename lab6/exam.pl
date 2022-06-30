miembro(X, [X|_]).
miembro(X, [_|Y]):- miembro(X,Y).

i([],_,[]).
i([X|_],[X|_],X).
i([Xhead|Xtail],[Yhead|Ytail],Z):-
    miembro(Yhead,Xtail),
    i([Xhead|Xtail],Ytail,[_|Yhead]).

i([Xhead|Xtail],[Yhead|Ytail],Z):-
    i([Xhead|Xtail],Ytail,Z).