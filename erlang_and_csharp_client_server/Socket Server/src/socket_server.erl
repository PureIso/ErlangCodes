%% Copyright
-module(socket_server).
-author("Ola").

%% API
-export([start_server/0]).
-define(Port,9000).

start_server()->
  Pid = spawn_link(fun() ->
    {ok,LSocket} = gen_tcp:listen(?Port,[binary,{active,false}]),
    spawn(fun() -> acceptState(LSocket) end),
    timer:sleep(infinity)
    end),
  {ok, Pid}.

acceptState(LSocket)->
  {ok, ASocket} = gen_tcp:accept(LSocket),
  spawn(fun() -> acceptState(LSocket) end),
  handler(ASocket).

handler(ASocket) ->
  inet:setopts(ASocket,[{active,once}]),
  receive
    {tcp,ASocket,<<"quit">>} ->
      gen_tcp:close(ASocket);
    {tcp,ASocket,<<"value=",X/binary>>} ->
      Val = list_to_integer(binary_to_list(X)),
      Return = Val * Val,
      gen_tcp:send(ASocket,"Result Sq: "++list_to_binary(integer_to_list(Return))),
      handler(ASocket);
    {tcp,ASocket,BinaryMsg} ->
      if
        (BinaryMsg =:= <<"UXLearner">>) ->
          gen_tcp:send(ASocket,"A for UX");
        true ->
          gen_tcp:send(ASocket,"Everything else")
      end,
      handler(ASocket)
  end.

