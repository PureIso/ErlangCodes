%% @author ola
%% @doc module for factorial
-module(server).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,stop/0,rpc/1,register/1]).
%%-compile(export_all).
-define(SERVER, server).

%% ====================================================================
%% Internal functions
%% ====================================================================
%%code:add_patha("C:/Users/LAB314/documents/GitHub/ErlangCodes/factorial/ebin").
%%cd("C:/Users/LAB314/Documents/GitHub/ErlangCodes/factorial/src").
%%rpc:call(node(),server,start,[]).

start() ->
	global:trans({?SERVER, ?SERVER},
				 fun() ->
						 case global:whereis_name(?SERVER) of
							 undefined ->
								 Pid = spawn(server,factorial_handler,[dict:new()]),
								 global:register_name(?SERVER, Pid);
							 _ ->
								 ok
						 end
				 end).

stop()->
	global:trans({?SERVER, ?SERVER},
				 fun() ->
						 case global:whereis_name(?SERVER) of
							 undefined ->
								 ok;
							 _ ->
								 global:send(?SERVER, stop)
						 end
				 end).

rpc(Request) ->
	global:send(?SERVER, Request).

register(Node)->
	Pid = spawn(server, factorial_handler,[Node]),
	io:format("Pid: ~p ~n" ,[Pid]),
	global:send(?SERVER, {register, Node, Pid}).
	
factorial_handler(Clients) ->
	receive
		{factorial, Node, Int}->
			case dict:find(Node, Clients) of
			{ok, Pid} ->
				Pid ! {factorial, Int};
			error ->
				io:format("Error! Unknown client: ~p~n", [Node])
			end,
			factorial_handler(Clients);
		{factorial, Int}->
			io:format("Factorial for ~p is ~p ~n",[Int, factorialCalculation:factorial(Int, 1)]),
			factorial_handler(Clients);
		{factorialRecorder, Int, File}->
			{ok, IoDevice} = file:open(File, write),
			factorialCalculation:factorialRecorder(Int,1,IoDevice),
			io:format("Factorial Recorder Done. ~n",[]),
			file:close(IoDevice),
			factorial_handler(Clients);
		{register,Node,Pid} ->
			io:format("Registered Name: ~p Pid: ~p ~n" ,[Node,Pid]),
			factorial_handler(dict:store(Node,Pid,Clients));
		stop ->
			io:format("Shutting down.~n");
		Other->
			io:format("Invalid Match for ~p~n" ,[Other]),
			factorial_handler(Clients)
	end.