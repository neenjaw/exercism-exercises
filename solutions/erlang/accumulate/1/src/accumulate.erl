-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) ->
  accumulate(Fn, Ls, []).

accumulate(_Fn, [], Acc) ->
  lists:reverse(Acc);
accumulate(Fn, [H | T], Acc) ->
  accumulate(Fn, T, [Fn(H) | Acc]).
