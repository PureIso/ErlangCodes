%% @author ola
%% @doc Factional calculation module

-module(factorialCalculation).

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).

%% ====================================================================
%% Internal functions
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
