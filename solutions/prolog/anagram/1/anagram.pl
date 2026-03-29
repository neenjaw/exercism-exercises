% Written for SWIPL 8.0.3

:- use_module(library(yall)).

:- dynamic anagram_match/2.

%
% anagram/3
%

anagram(Word, Options, Matching) :-
  string_lower_sort(Word, Lowered, Sorted),

  findall(
    anagram_match(Option, LoweredOption),
    (
      member(Option, Options),
      string_lower_sort(Option, LoweredOption, SortedOption),
      \+ Lowered = LoweredOption,
      Sorted = SortedOption
    ),
    AllMatchingTuples
  ),

  remove_subsequent_duplicates(AllMatchingTuples, UniqMatchingTuple),
  maplist([T, W]>>(anagram_match(W, _) = T), UniqMatchingTuple, Matching).



%
% string_lower_sort/3
%

string_lower_sort(Word, Lowered, Sorted) :-
  string_lower(Word, Lowered),
  string_to_list(Lowered, List),
  msort(List, SortedList),
  string_to_list(Sorted, SortedList).

%
% remove_subsequent_duplicates/2 remove_subsequent_duplicates/3
%

% Expand to remove_subsequent_duplicates/3 with default option
remove_subsequent_duplicates(PossibleDuplicates, UniqueList) :-
  remove_subsequent_duplicates(PossibleDuplicates, [], UniqueList).

% Basecase, reverse the accumulator
remove_subsequent_duplicates([], RevUniqueList, UniqueList) :-
  reverse(RevUniqueList, UniqueList).

% If the possibility is unique, then keep in accumulator, recurse
remove_subsequent_duplicates([Possibility | RemPossibilities], Acc, UniqueList) :-
  check_if_unique(Possibility, Acc),
  !,
  remove_subsequent_duplicates(RemPossibilities, [Possibility | Acc], UniqueList).

% If not unique, move to next possibility
remove_subsequent_duplicates([_ | RemPossibilities], Acc, UniqueList) :-
  remove_subsequent_duplicates(RemPossibilities, Acc, UniqueList).


%
% check_if_unique/2
%

check_if_unique(anagram_match(_, LoweredWord), UniqueTuples) :-
  findall(
    UniqueLowered,
    member(anagram_match(_, UniqueLowered), UniqueTuples),
    UniqueLowereds
  ),

  \+ member(LoweredWord, UniqueLowereds).