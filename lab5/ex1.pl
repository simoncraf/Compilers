%Simone Gigante 205702

%LAB 4
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

%LAB 5 expressions from here

%if statement
encodestatement(if(Test,Then,Else),
        D,
        (Testcode;
        Thencode;
        instr(jump,L2);
        label(L1);
        Elsecode;
        label(L2))
        ):- encodetest(Test,D,L1,Testcode),
            encodestatement(Then,D,Thencode),
            encodestatement(Else,D,Elsecode).

encodetest( test(Op,A1,A2),D,L, (Ecode; instr(J,L))):-
    encodeexpr(expr(-,A1,A2),D,Ecode),
    newop(Op,Jumpif).
%Control transfer: JUMPEQ, JUMPNE, JUMPLT, JUMPGT, JUMPGE, JUMP

newop(=,jumpne).
newop(>,jumple).
newop(<,jumpge).
newop(>=,jumplt).
newop(<=,jumpgt).
newop(!=,jumpeq).

%while statement
encodestatement(while(Test,Do),
    D,
    (label(L1);Testcode;Docode;instrGump,L1);label(L2)):-
        encodetest(Test,D,L2,Testcode),
        encodestatement(Do,D,Docode).

%read
encodestatement(read(name(X)),
    D,
    instr(read,Addr)):-
        lookup(X,D,Addr).

%write
encodestatement(write(Expr),
    D,
    (Exprcode; instr(write,0))):-
        encodeexpr(Expr,D,Exprcode).

%sequence
encodestatement((S1; S2),D,(Code1;Code2)):-
    encodestatement(S1,D,Code1),
    encodestatement(S2,D,Code2).