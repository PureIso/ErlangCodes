-module(main).
-author("ola").
-export([speak/1]).

speak(Animal)->
  Sound = if
            (Animal == cat) -> miow;
            (Animal == dog) -> roff_roff;
            true -> no_animal
          end,
  io:format("~p makes ~p sound. ~n",[Animal,Sound]).
