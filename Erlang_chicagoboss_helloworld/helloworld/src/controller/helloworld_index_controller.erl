-module(helloworld_index_controller,[Req]).
-export([index/2]).

index('GET',[]) ->
	{ok, [{hello,"Hello World!"}]}.