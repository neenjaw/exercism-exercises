leap(Y) :-
  D4 is Y mod 4, D4 == 0,
  (
    (D100 is Y mod 100, D100 \== 0)
    ;
    (D400 is Y mod 400, D400 == 0)
  ),
  !.
