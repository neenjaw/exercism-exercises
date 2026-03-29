-module(collatz_conjecture).

-export([steps/1]).

steps(N) when is_integer(N) andalso N > 0 ->
  steps(N, 0);
steps(_) ->
  erlang:error(badarg).

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
