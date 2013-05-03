%% Copyright
-module(client).
-author("LAB314").

-export([factorial/1, factorialRecorder/2]).

factorial(Val)->
  server:factorial(Val).

factorialRecorder(Val, IoDevice) ->
  server:factorial(Val, IoDevice).