-module(main).
-author("ola").

%% API
-export([area/1,area/3]).

%%Normal
area(Type, N, M) ->
  case Type of
    square -> N*N;                %%Area of a square
    circle -> math:pi() * N* N;   %%Fully qualifying is better that using -import(math,[pi/0]).
    triagle -> 0.5 * N * M;
    rectangle -> N * M
  end.

%%Using Pattern Matching - using tuple
area({square, S}) ->
  S*S;
area({circle, R}) ->
  math:pi() * R * R;
area({triangle, B , H}) ->
  0.5 * B * H;
area({rectangle, L, B}) ->
  L * B;
area({_}) ->
  io:format("Invalid Pattern ~n").
