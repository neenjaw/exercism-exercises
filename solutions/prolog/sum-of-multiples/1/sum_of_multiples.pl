:- use_module(library(lists)).
:- use_module(library(yall)).
:- use_module(library(apply)).
:- use_module(library(clpfd)).
:- use_module(library(apply_macros)).

collect_multiples(_, 1, []).

collect_multiples(N, Limit, Multiples) :-
    findall(
        M,
        (between(1, Limit, M), 0 #= M mod N, M #\= Limit),
        Multiples
    ).    

sum_of_multiples(List, Limit, Result) :-
    maplist({Limit}/[N, Ms]>>collect_multiples(N, Limit, Ms), List, ListMs),
    flatten(ListMs, AllMs),
    (AllMs = [] -> UniqMs = [] ; setof(M, member(M, AllMs), UniqMs)),
    sum_list(UniqMs, Result).
    
:- collect_multiples(3, 20, Ms),
    format("Multiples of ~w between 0 and ~w: ~w~n", [3, 20, Ms]).

:- sum_of_multiples([3, 5], 1, R), 
    format("Answer: ~w~n", [R]).