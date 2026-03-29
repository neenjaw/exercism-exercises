-module(collatz_conjecture).

-export([steps/1]).

steps(N) when N =< 0 ->
  erlang:error(badarg);
steps(N) ->
  steps(N, 0).

steps(1, C) ->
  C;
steps(N, C) when N rem 2 == 0 ->
  Nx = N div 2,
  Cx = C + 1,
  steps(Nx, Cx);
steps(N, C) ->
  Nx = 3 * N + 1,
  Cx = C + 1,
  steps(Nx, Cx).
