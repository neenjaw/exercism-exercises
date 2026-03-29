:- use_module(library(lists)).

pascal(N, Rows) :-
  pascal(N, 0, [], Rows), !.

pascal(NGoal, NCurr, Acc, Rows) :-
  NCurr > NGoal,
  reverse(Acc, Rows).

pascal(NGoal, 0, Acc, Rows) :-
  pascal(NGoal, 1, Acc, Rows).

pascal(NGoal, NCurr, Acc, Rows) :-
  NCurr > 0,
  NCurr =< NGoal,
  get_row(NCurr, Acc, Row),
  NextNCurr is NCurr + 1,
  pascal(NGoal, NextNCurr, [Row | Acc], Rows).

get_row(1, _Acc, [1]).

get_row(_N, [PrevRow | _], Row) :-
  BuildFrom = [0 | PrevRow],
  build_row(BuildFrom, [], Row).
  
build_row([Last], Acc, [Last | Acc]).

build_row([L1, L2 | Rest], Acc, Row) :-
  Value is L1+L2,
  build_row([L2 | Rest], [Value | Acc], Row).
