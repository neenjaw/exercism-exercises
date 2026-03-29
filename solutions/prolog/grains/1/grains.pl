:- use_module(library(clpfd)).

square(SquareNumber, _) :-
    (
        SquareNumber #=< 0;
        SquareNumber #> 64
    ),
    !,
    fail.

square(SquareNumber, Value) :-
    Exponent #= SquareNumber - 1,
    pow(2, Exponent, Value).

total(Value) :-
    Limit #= 64,
    Value #= 1 << (Limit) - 1.
