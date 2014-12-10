-module(main).
-author("ola").

%% API
-export([add/2,factorial/1]).

add(X, Y)->
  io:format("~p + ~p = ~p ~n",[X,Y,X+Y]).

factorial(N) when N > 0 ->
  N * factorial(N -1);       %%Simple Recursion
factorial(0) ->              %%When N = 0 return 1
  1.