
/*
TEST:
1)
member(1,[1,2,3]). (Result TRUE)
member(3,[1,2,3]). (Result TRUE)
member(7,[1,2,3]). (Result FALSE)
member(X,[1,2,3]). followed by ; to see all the possible values of X  (1,2,3)

2)
add(a,[b,c,d],[a,b,c,d]). (Result TRUE)
add(a,[b,c,d],[a,b,c,e]). (Result FALSE)
add(a,[b,c,d],X). (Result X = [a, b, c, d].)

3)
quita(a,[b,a,c],X). (Result X = [b,c])
quita(a,[a,b,c],X). (Result X = [b,c])
quita(Y,[b,a,c],X). followed by ; to see all the possible results

4)
concatenate([1,2],[3,4,5],X). (Result X = [1,2,3,4,5])
concatenate([1,2],[3,4,5],[1,2,3,4,5]). Result TRUE
concatenate([1,2],[3,4,5],[1,2,b,3,4,5]). Result FALSE

5)
sublist(X,[1,2,3,4,5,6]). (All subgrups of Y)
sublist([3,5],[1,2,3,4,5,6]). (Result TRUE)
*/

%1
member(X, [X|_]).
member(X, [_|Y]):- member(X,Y).

%2
append(X,Y,Y):- member(X,Y), !. % Si no queremos duplicados
append(X,Y,[X|Y]).
add(X,Y,Z):- append(X,Y,Z).
%3
delete(X,[X],[]).
delete(X,[X|Y],Y).
delete(X,[Y|Z],[Y|K]):- delete(X,Z,K).
quita(X,Y,Z):- delete(X,Y,Z).

%4
concatenate([],X,X).
concatenate([X1|Y1],Y2,[X1|Y3]):- concatenate(Y1,Y2,Y3).

%5
sublist([],[]).
sublist([First | Sub], [First | Rest]):- sublist(Sub, Rest).
sublist(Sub, [First | Rest]):- sublist(Sub, Rest).
