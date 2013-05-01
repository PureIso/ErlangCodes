%% Copyright
-module(server).
-author("Ola").

-behaviour(gen_server).
-record(state, {}).
%% API
-export([start_link/0, factorial/1,stop/0]).

%% gen_server
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
  code_change/3]).

%% API Client Call
start_link() ->
  gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).

stop() ->
  gen_server:cast({global,?MODULE}, stop).

factorial(Val) ->
  %% spawn(fun() -> divide_server:divide(10,0) end).
  gen_server:call({global,?MODULE},{factorial,Val}).





%% gen_server callbacks
init([]) ->
  %%% we ensure that the supervisor to receive messages
  process_flag(trap_exit, true),
  io:format("~p (~p) starting.... ~n", [?MODULE, self()]),
  {ok, #state{}}.

handle_call({factorial,Val}, _From, State) ->
  {reply,factorial:factorial(Val,1),State};

handle_call(_Request, _From, State) ->
  {reply,error, State}.

handle_cast(stop, State) ->
  {stop, normal, State};

handle_cast(_Request, State) ->
  {noreply, State}.

%% handle info - server ! hello
handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  io:format("terminating ~p~n", [?MODULE]),
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
