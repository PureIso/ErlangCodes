%% @author ola
%% @doc module for factorial
-module(server).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,stop/0,rpc/1]).
-define(SERVER, server).

%% ====================================================================
%% Internal functions
%% ====================================================================
%%code:add_path("C:/Users/ola/Desktop/Eclipse/factorial/ebin").

start() ->
	global:trans({?SERVER, ?SERVER},
				 fun() ->
						 case global:whereis_name(?SERVER) of
							 undefined ->
								 Pid = spawn(fun factorial_handler/0),
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

factorial_handler() ->
	receive
		{factorial, Int}->
			io:format("Factorial for ~p is ~p ~n",[Int, factorialCalculation:factorial(Int, 1)]),
			factorial_handler();
		{factorialRecorder, Int, File}->
			{ok, IoDevice} = file:open(File, write),
			factorialCalculation:factorialRecorder(Int,1,IoDevice),
			io:format("Factorial Recorder Done. ~n",[]),
			file:close(IoDevice),
			factorial_handler();
		stop ->
			io:format("Shutting down.~n");
		Other->
			io:format("Invalid Match for ~p~n" ,[Other]),
			factorial_handler()
	end.