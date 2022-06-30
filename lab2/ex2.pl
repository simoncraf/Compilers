%Simone GIgante 205702

initial(1).
final(4).
arc(1,2,j).
arc(2,1,a).
arc(2,3,a).
arc(3,4,!).

%Recognize the string
recognize(Words) :-
initial(Node),
recognize(Node,Words).

recognize(Node,[]) :-
final(Node).

recognize(FromNode,String) :-
arc(FromNode,ToNode,Label),
traverse(Label,String,NewString),
recognize(ToNode,NewString).

traverse(First,[First|Rest],Rest).

%Generate the strings as they are infinite it gives the "Out of local stack" error
generate(X):-
recognize(X),
write(X),
fail.