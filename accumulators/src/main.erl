-module(main).
-author("ola").
-export([factorial/1, factorial/2]).

%%Normal Factorial - Recurrsion
factorial(N) when N > 0 ->
  N*factorial(N-1);
factorial(0) ->
  1.

%%Accumulator Factorial
factorial(N, TotalFactorialAccumulator) when N > 0 -> %%TotalFactorialAccumulator starts at 1
  factorial(N-1, N *TotalFactorialAccumulator);
factorial(0, TotalFactorialAccumulator) ->
  TotalFactorialAccumulator.