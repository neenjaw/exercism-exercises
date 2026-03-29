% Spiral Matrix Module -- Built for SWI-PL v8.0.3

:- module(spiral_matrix, [spiral/2]).

:- use_module(library(apply)).
:- use_module(library(clpfd)).

%% spiral(?N, ?M)
%  N is the size of the square matrix making dimensions N x N
%  M is the matrix represented by a list where each element is a row defined as a list

spiral(N, M) :-
  length(M, N),
  maplist(same_length(M), M),
  append(M, Vs),
  Max is N ** N,
  Vs ins 1..Max,
  number_cells(M), !.

%% number_cells/2
%  module predicate for applying contraints for each element

number_cells([]) :- !.

number_cells(M) :-
  number_cells(right, 1, M).

%% number_cells/3
%  module predicate for applying constraints for each element
%
%  Method:
%  - using CLP(FD), apply contraints to the free variables as traverse along the matrix
%  - right: the row's contents must be increasing, turn downward
%  - down: the last element in the row must be increasing,
%          add the current row (minus the last element) to a stack to facilitate later traversal
%          if there are more rows, do the same rule, if no more rows, go leftward
%  - left: all elements in the row must be decreasing, pass along the stack, go up
%  - up: the first element must increase from the last, rebuild the matrix (minus the first) as traverse
%        if more on the stack, go up, if stack is empty, go right

number_cells(_, _, []).

% rightward application of contraints

number_cells(right, N, [R | M]) :-
  [H | _] = R,
  H #= N,
  increasing(R),
  append(_, [Last], R),
  number_cells(down, Last, M).

% downward application of constraints, add stack to be able to iterate up matrix

number_cells(down, N, M) :-
  number_cells(down, N, M, []).

% downward application of constraints

number_cells(down, N, [R], S) :-
  !, % commit to last row
  append(First, [Last], R),
  Last #= N + 1,
  N1 #= Last + 1,
  number_cells(left, N1, First, S).

number_cells(down, N, [R | M], S) :-
  append(First, [Last], R),
  Last #= N + 1,
  number_cells(down, Last, M, [First | S]).

% leftward application of constraints

number_cells(left, N, Row, Stack) :-
  append(_, [N], Row),
  decreasing(Row),
  [H | _] = Row,
  N1 #= H + 1,
  number_cells(up, N1, [], Stack).

% upward application of constraints

number_cells(up, N, Rows, []) :-
  number_cells(right, N, Rows).

number_cells(up, N, Rows, Stack) :-
  [Top | RemStack] = Stack,
  [N | RemRow] = Top,
  succ(N, N1),
  number_cells(up, N1, [RemRow | Rows], RemStack).


%% increasing/1
%  uses clpfd #= to apply numerical constraint

increasing([]).
increasing([_]).
increasing([N1, N2 | T]) :- N2 #= N1 + 1, increasing([N2 | T]).

%% decreasing/1
%  uses clpfd #= to apply numerical constraint

decreasing([]).
decreasing([_]).
decreasing([N1, N2 | T]) :- N1 #= N2 + 1, decreasing([N2 | T]).
