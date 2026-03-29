-module(rna_transcription).

-export([to_rna/1]).

to_rna(Dna) -> lists:map(fun transcribe/1, Dna).

transcribe($A) -> $U;
transcribe($C) -> $G;
transcribe($T) -> $A;
transcribe($G) -> $C.

