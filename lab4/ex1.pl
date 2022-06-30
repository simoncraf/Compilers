% Simone Gigante 205702
/*
TESTS:
encodestatement(assign(name(x),name(y)),D,X). 
OUTPUT:
D = dic(x, _5572, _5580, dic(y, _5588, _5596, _5598)),
X =  (instr(load, _5588);instr(store, _5572)) .

encodestatement(assign(name(x),const(a)),D,X).
OUTPUT
D = dic(x, _4838, _4846, _4848),
X =  (instr(loadc, a);instr(store, _4838)) .
*/

lookup(Name, dic(Name, Value, _, _), Value).
lookup(Name, dic(Word, _, Prev, Next), Value) :- 
     Name @> Word, lookup(Name, Next, Value) ; 
     Name @< Word, lookup(Name, Prev, Value).


opc(+,addc).
opc(-,subc).
opc(*,mulc).
opc(/,divc).
opv(+,add).
opv(-,sub).
opv(*,mul).
opv(/,div).


encodestatement(assign(name(X),Expr),D,(E_code ; instr(store,Addr))) :- 
    lookup(X,D,Addr),
    encodeexpr(Expr,D,E_code).


encodeexpr(const(Constant),_,instr(loadc,Constant)).
encodeexpr(name(X), D, instr(load, Addr)):-
    lookup(X,D,Addr).
encodeexpr(expr(Op, Expr1, Expr2),0,(Function; Instr)):-
    run(Op,Expr2,D,Instr),
    encodeexpr(Expr1,D,Function).

run(Op,const(Constant),_,instr(Instruction,Constant)):-
    opc(Op,Instruction).
run(Op, name(X),D,instr(Instruction,Addr)):-
    opv(Op,Instruction),
    lookup(X,D,Addr).

