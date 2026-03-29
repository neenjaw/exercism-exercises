-module(raindrops).

-export([convert/1]).

-define(FACTORS, [ 7, 5, 3 ]).

convert(Number) -> convert(Number, ?FACTORS, []).

% Base case - no matching factors
convert(Number, [], []) -> integer_to_list(Number);

% Base case - all factors tested
convert(_Number, [], Acc) -> lists:append(Acc);

% Check for factors
convert(Number, [Factor | T], Acc) when (Number rem Factor) == 0 ->
  Msg = get_msg(Factor),
  convert(Number, T, [Msg | Acc]);

% Head isn't a factor, discard it, check the next
convert(Number, [_ | T], Acc) ->
  convert(Number, T, Acc).

get_msg(F) ->
  Msgs = #{3 => "Pling", 5 => "Plang", 7 => "Plong"},
  maps:get(F, Msgs).