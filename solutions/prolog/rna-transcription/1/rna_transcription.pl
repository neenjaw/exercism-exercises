:- use_module(library(lists)).

complement(`G`, `C`).
complement(`C`, `G`).
complement(`T`, `A`).
complement(`A`, `U`).

rna_transcription(Dna, Rna) :-
  string_to_list(Dna, DnaList),
  phrase(transcribe(DnaList), RnaList),
  string_to_list(Rna, RnaList).

transcribe([]) --> [].

transcribe([Nd | Strand]) --> { complement([Nd], [Nr]) },
                              [Nr],
                              transcribe(Strand).
