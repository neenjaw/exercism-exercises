-module(raindrops).

-export([convert/1]).

-define(FACTORS, [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]).

convert(Number) ->
  Msgs = [M || {F, M} <- ?FACTORS, (Number rem F) == 0],
  convert(Number, Msgs).

% Base case - no matching factors
convert(Number, []) -> integer_to_list(Number);

% Base case - all factors tested
convert(_Number, Msgs) -> lists:append(Msgs).