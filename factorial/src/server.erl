%% @author ola
%% @doc server that computes factorial on a multi node environment
-module(server).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,stop/1,rpc/1,register/1,members/0]).
%% macro definition
-define(SERVER, server).
%% ====================================================================
%% Internal functions
%% ====================================================================

%% Start server function - can only be called once or when ever server is off
start() ->
	%% Global work across multiple nodes - insync across all nodes
	%% Create a sync block which work across all the nodes - only one call at a time is active
	%% only one ?SERVER
	global:trans({?SERVER, ?SERVER},
				 fun() ->
						%% Enforcing control to prevent multiple instance
						%% if ?SERVER has not been registered
						 case global:whereis_name(?SERVER) of
							 undefined ->
								 %% Create a new process with new dictionay
								 Pid = spawn(factorialCalculation,factorial_handler,[dict:new()]),
								 %% Global register
								 global:register_name(?SERVER, Pid);
							 _ ->
								 ok
						 end
				 end).

stop(Node)->
	%% Global send - looks up the name in the global directory, 
	%% finds the process and the node which the process is running
	%% send the message to that process
	global:send(?SERVER, {stop,Node}).

rpc(Request) ->
	global:send(?SERVER, Request).
	
members() ->
	global:send(?SERVER, members).

register(Node)->
	%% Create a new pid for the new node joining
	Pid = spawn(factorialCalculation, factorial_handler,[Node]),
	global:send(?SERVER, {register, Node, Pid}).
	
