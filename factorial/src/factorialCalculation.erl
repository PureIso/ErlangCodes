%% @author ola
%% @doc Factional calculation module

-module(factorialCalculation).

%% ====================================================================
%% API functions
%% ====================================================================
-export([factorial_handler/1]).

%% ====================================================================
%% Private functions
%% ====================================================================

factorial(Int, Acc)
  when Int > 0 ->
	factorial(Int-1,Acc * Int);
factorial(0, Acc) ->
	Acc.

factorial(Int, Acc, IoDevice)
  when Int > 0 ->
	io:format(IoDevice, "Current Factorial Log: ~p~n",[Acc]),
	factorial(Int-1,Acc * Int,IoDevice);
factorial(0, Acc,IoDevice) ->
	io:format(IoDevice, "Factorial Results: ~p~n",[Acc]).

%% ====================================================================
%% Public functions
%% ====================================================================
factorial_handler(Clients) ->
	receive
		{factorial, Int}->
			io:format("Factorial for ~p is ~p ~n",[Int, factorial(Int, 1)]),
			factorial_handler(Clients);
		
		{factorialRecorder, Int, File}->
			{ok, IoDevice} = file:open(File, write),
			factorial(Int,1,IoDevice),
			io:format("Factorial Recorder Done. ~n",[]),
			file:close(IoDevice),
			factorial_handler(Clients);
		
		%% RPC Reciever - factorial
		{factorial, Node, Int}->
			case dict:find(Node, Clients) of
				{ok, Pid} ->
					Pid ! {factorial, Int},
					io:format("Message To: ~p PID: ~p ~n", [Node,Pid]);
				error ->
					io:format("Error - Unknown client: ~p~n", [Node])
			end,
			factorial_handler(Clients);
		
		%% Register a new node
		{register,Node,Pid} ->
			case dict:find(Node, Clients) of
			{ok, Pid} ->
				io:format("Already registered: ~p PID: ~p ~n", [Node,Pid]);
			error ->
				io:format("Registered Node: ~p~n",[Node]),
				factorial_handler(dict:store(Node,Pid,Clients))
			end;
		
		%% Stop a specified node
		{stop,Node} ->
			case dict:find(Node, Clients) of
				{ok, Pid} ->
					Pid ! shutdown,
					factorial_handler(dict:erase(Node,Clients));
				error ->
					io:format("Error! Unknown client: ~p~n", [Node]),
					factorial_handler(Clients)
			end;
		
		%% Shut down function
		shutdown ->
			io:format("Shutting down!!");
		
		%% Display Client dictionary
		members ->
			io:format("dict: ~p~n",[Clients]),
			factorial_handler(Clients);
		
		%% Everything else
		Other->
			io:format("Invalid Match for ~p~n" ,[Other]),
			factorial_handler(Clients)
	end.