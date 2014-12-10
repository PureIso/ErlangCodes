-module(main).
-author("ola").
-export([countdown_from/2,concurrency_countdown_from/2]).

countdown_from(Start,End) when Start == End ->
  io:format("Count is now finished ~n");
countdown_from(Start, End) ->
  io:format("~p ~n",[Start]),
  countdown_from(Start-1, End).

concurrency_countdown_from(Start, End)->
  spawn(main,countdown_from,[Start,round(Start/2)]),
  spawn(main,countdown_from,[round(Start/2),End]).

