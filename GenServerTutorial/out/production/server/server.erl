%% Copyright
-module(server).
-author("Ola").

-behaviour(gen_server).

%% API
-export([start_link/0, factorial/1]).

%% gen_server
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
  code_change/3]).

%% API
start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

factorial(Val) ->
  %% spawn(fun() -> divide_server:divide(10,0) end).
  gen_server:call(?MODULE,{factorial,Val}).


%% gen_server callbacks
init(_Args) ->
  process_flag(trap_exit, true),
  io:format("~p (~p) starting...~n", [?MODULE, self()]),
  {ok, []}.

handle_call({factorial,Val}, _From, State) ->
  {reply,factorial(Val,1),State};

handle_call(_Request, _From, State) ->
  {reply,error, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.


factorial(Int, Acc)
  when Int > 0 ->
  factorial(Int-1,Acc * Int);
factorial(0, Acc) ->
  Acc.