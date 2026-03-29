-module(raindrops).

-export([convert/1]).

convert(Number) -> do_convert(Number, [7, 5, 3], []).

% Base case - no matching factors
do_convert(Number, [], []) -> integer_to_list(Number);

% Base case - all factors tested
do_convert(_Number, [], Acc) -> lists:append(Acc);

% Check for factors
do_convert(Number, [7 | T], Acc) when (Number rem 7) == 0 ->
  do_convert(Number, T, ["Plong" | Acc]);

do_convert(Number, [5 | T], Acc) when (Number rem 5) == 0 ->
  do_convert(Number, T, ["Plang" | Acc]);

do_convert(Number, [3 | T], Acc) when (Number rem 3) == 0 ->
  do_convert(Number, T, ["Pling" | Acc]);

% Head isn't a factor, discard it, check the next
do_convert(Number, [_ | T], Acc) ->
  do_convert(Number, T, Acc).
