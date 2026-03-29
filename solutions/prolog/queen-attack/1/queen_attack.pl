% Queen Attack - Exercism Prolog Core Track Exercise #2

:- use_module(library(clpfd)).

% create

create((Row,Column)) :-
  [Row, Column] ins 0..7.

% attack

attack(QueenA, QueenB) :-
  % each queen must be unique
  QueenA \== QueenB,

  % validate position
  create(QueenA),
  create(QueenB),

  % decontruct the compound term
  (RowA, ColumnA) = QueenA,
  (RowB, ColumnB) = QueenB,

  % check for in line conditions
  (
    (RowA #= RowB)
    #\/ (ColumnA #= ColumnB)
    #\/ (abs(RowA - RowB) #= abs(ColumnA - ColumnB))
  ).