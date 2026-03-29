hamming_distance(Str1, Str2, Dist) :-
  string_to_list(Str1, L1),
  string_to_list(Str2, L2),
  hamming_distance(L1, L2, 0, Dist).

hamming_distance([], [], Dist, Dist).

hamming_distance([N1|L1], [N2|L2], Acc, Dist) :-
  N1 =\= N2,
  !,
  NextAcc is Acc + 1,
  hamming_distance(L1, L2, NextAcc, Dist).

hamming_distance([N1|L1], [N1|L2], Acc, Dist) :-
  hamming_distance(L1, L2, Acc, Dist).
