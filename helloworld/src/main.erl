-module(main).
-author("ola").

-export([print_helloworld/0]).

print_helloworld()->
  io:format("Hello World ~n").