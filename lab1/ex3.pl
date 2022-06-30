/* 
Ejecutar sudoku(1,L) para ver la solución del sudoku 1
Ejecutar sudoku(2,L) para ver la solución del sudoku 2 (NO TIENE)
Ejecutar sudoku(3,L) para ver las soluciones del sudoku 3 (MULTIPLES, usar ;)
Repetir con 4 y 5.
*/
sudoku(1,[1,4,_,_,
            _,_,4,_,
            2,_,_,_,
            _,_,_,3]).

sudoku(2,  [2,4,_,_,
            _,_,3,_,
            4,_,_,_,
            _,1,_,_]).

sudoku(3,  [_,_,_,_,
            _,_,_,_,
            _,_,_,_,
            _,_,_,_]).

sudoku(4,  [_,_,_,1,
            _,_,2,_,
            _,3,_,_,
            4,_,_,_]).

sudoku(5,  [1,_,_,1,
            _,2,2,_,
            _,3,3,_,
            4,_,_,4]).

miembro(X, [X|_]).
miembro(X, [_|Y]):- miembro(X,Y).

numero(X):-
   miembro(X,[1,2,3,4]).

% solucion_sudoku(S,L) se verifica si L es la solución del sudoku del ejemplo S.
solucion_sudoku(S,L) :-
   length(L,16),
   sudoku(S,L),
   solution(L).

% solution(L) verifica si L es una solución del sudoku.
solution([R11,R12,R13,R14,
             R21,R22,R23,R24,
             R31,R32,R33,R34,
             R41,R42,R43,R44]) :-
   numbers([R11,R12,R13,R14]), numbers([R21,R22,R23,R24]), 
   numbers([R31,R32,R33,R34]), numbers([R41,R42,R43,R44]), 
   numbers([R11,R21,R31,R41]), numbers([R12,R22,R32,R42]), 
   numbers([R13,R23,R33,R43]), numbers([R14,R24,R34,R44]),
   numbers([R11,R12,R21,R22]), numbers([R13,R14,R23,R24]), 
   numbers([R31,R32,R41,R42]), numbers([R33,R34,R43,R44]). 

% numbers(L) se verifica si L es una lista de números distintos entre 1 y 4
numbers([]).
numbers([X|Xs]) :-
   numbers(Xs),
   numero(X),
   \+ miembro(X,Xs).


% Esta parte la he encontrado en internet y sirve para que la respuesta no se corte
:- set_prolog_flag(answer_write_options,
                   [ quoted(true),
                     portray(true),
                     spacing(next_argument)
                   ]).
