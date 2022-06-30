%Simone GIgante 205702

/* 
TESTS:
recognize([j,a,!]) OUTPUT: True, [1,j,2,a,3,!,4]
recognize([j,a,j,a,j,a,!]) True, [1,j,2,a,1,j,2,a,1,j,2,a,3,!,4]
recognize([j,a,a,!]) False

*/

initial(1).
final(4).
arc(1,2,j).
arc(2,1,a).
arc(2,3,a).
arc(3,4,!).

%Recognize the string
recognize(X) :-
initial(Node),
append([],[Node],Z),
recognize(Node,X,Z).

recognize(Node,[],Path) :-
final(Node),
reverseList(Path,X), 
write(X),nl.

recognize(FromNode,String,Path) :-
arc(FromNode,ToNode,Label),
traverse(Label,String,NewString),
append([ToNode,Label],Path,Z),
recognize(ToNode,NewString,Z).

traverse(First,[First|Rest],Rest).

reverseList([],[]).
reverseList([X],[X]).
reverseList([H|T],R):-
    reverseList(T, AUX),
    append(AUX,[H],R).

