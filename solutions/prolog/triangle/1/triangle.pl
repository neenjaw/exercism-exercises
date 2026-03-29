% Check to unify with triangle inequality
% Assumes A, B, C are sorted in increasing order
triangle_inequality(A, B, C) :-
  A + B > C.

triangle(A, A, A, "equilateral") :-
  A > 0,
  !.

triangle(A, B, C, "isosceles") :-
  msort([A, B, C], [D, E, F]),
  triangle_inequality(D, E, F),
  (
    (D =:= E, E \== F);
    (E =:= F, D \== E)
  ),
  !.

triangle(A, B, C, "scalene") :-
  msort([A, B, C], [D, E, F]),
  triangle_inequality(D, E, F),
  0 < D,
  D < E,
  E < F,
  !.
