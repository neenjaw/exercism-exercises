:- use_module(library(lists)).

alphabet(A) :-
  string_to_list("abcdefghijklmnopqrstuvwxyz", A).

nonletter(N) :-
  string_to_list(". -", N).

isogram(String) :-
  string_lower(String, Lowered),
  string_to_list(Lowered, Characters),
  alphabet(Alphabet),
  check_isogram(Characters, Alphabet).

check_isogram([], _Alpha).

check_isogram([Letter | Rest], Alpha) :-
  member(Letter, Alpha),
  !,
  delete(Alpha, Letter, RemAlpha),
  check_isogram(Rest, RemAlpha).

check_isogram([Other | Rest], Alpha) :-
  nonletter(N),
  member(Other, N),
  !,
  check_isogram(Rest, Alpha).