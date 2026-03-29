:- use_module(library(lists)).
:- use_module(library(apply)).

can_chain(Dominoes) :-
  chain(Dominoes, _Chain), !.

chain([], []).

chain(Dominoes, Chain) :-
  chain(Dominoes, [], Chain).

chain(Dominoes, [], Chain) :-
  select(Domino, Dominoes, Remaining),
  (L,R) = Domino,
  (
    chain(Remaining, R, [(L,R)], Chain)
    ;
    chain(Remaining, L, [(R,L)], Chain)
  ).

chain([], Start, Chain, Chain) :-
  [(End, _) | _] = Chain,
  Start == End.

chain(Dominoes, Start, AccChain, Chain) :-
  select(Domino, Dominoes, Remaining),
  (L, R) = Domino,
  [(Last, _) | _] = AccChain,
  (
    (
      L == Last,
      chain(Remaining, Start, [(R, L) | AccChain], Chain)
    );
    (
      R == Last,
      chain(Remaining, Start, [(L, R) | AccChain], Chain)
    )
  ).