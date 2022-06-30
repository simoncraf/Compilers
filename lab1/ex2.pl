%1
miembro(X, [X|_]).
miembro(X, [_|Y]):- miembro(X,Y).

sublista([],[]).
sublista([First | Sub], [First | Rest]):- sublista(Sub, Rest).
sublista(Sub, [First | Rest]):- sublista(Sub, Rest).

right_of(X, Y) :- X is Y+1.

solution(Street):-
        presolution(Street),
        miembro(Street,house(_, English, Red, _ )),
        miembro(Street,house(_, Spanish, _, Jaguar)),
        miembro(Street,house(X, Japanese, _ , _ )),
        miembro(Street,house(Y, _ , _ , Snail)),
        to_right(X,Y),
        miembro(Street,house(Z, _, Blue,_)),
        to_right(Y,Z),
        miembro(Street,house(_ ,_ , Green, _)),
        miembro(Street,house( _ , _ , _ , Frog)).

presolution([house(_,_,_,_),
             house(_,_,_,_),
             house(_,_,_,_)]).