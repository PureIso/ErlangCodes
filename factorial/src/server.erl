%% @author ola
%% @doc module for factorial
-module(server).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,stop/0,rpc/1,register/1,members/0]).
-define(SERVER, server).
%% ====================================================================
%% Internal functions
%% ====================================================================

start() ->
	global:trans({?SERVER, ?SERVER},
				 fun() ->
						 case global:whereis_name(?SERVER) of
							 undefined ->
								 Pid = spawn(factorialCalculation,factorial_handler,[dict:new()]),
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
	
members() ->
	global:send(?SERVER, members).

register(Node)->
	Pid = spawn(factorialCalculation, factorial_handler,[Node]),
	global:send(?SERVER, {register, Node, Pid}).
	
