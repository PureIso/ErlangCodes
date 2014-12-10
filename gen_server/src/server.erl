%% Copyright
-module(server).
-author("Ola").

%% Let the compiler know this is a gen_server
%% Must implement the functions
-behaviour(gen_server).

%% API
-export([start_link/0, factorial/1, stop/0, factorial/2]).

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

factorial(Val,IoDevice) ->
%% spawn(fun() -> divide_server:divide(10,0) end).
  gen_server:call({global,?MODULE},{factorial,Val,IoDevice}).

%% gen_server callbacks
%% gen_server calls on start up
%% [] = state - something persistent between each message example: a dictionary
init([]) ->
  %%% we ensure that the supervisor to receive notification when the process goes down
  %%% When a process traps exists when ever the process dies it sends a message to the supervisor
  process_flag(trap_exit, true),
  io:format("~p (~p) starting.... ~n", [{global, ?MODULE}, self()]),
  {ok, []}.

handle_call(stop, _From, State) ->
  {stop, normal, ok, State};

handle_call({factorial,Val}, _From, State) ->
  Pid = spawn(fun() -> factorial_logic:factorial_handler() end),
  {reply, Pid ! {factorial, Val},State};

handle_call({factorial,Val,IoDevice}, _From, State) ->
  Pid = spawn(fun() -> factorial_logic:factorial_handler() end),
  {reply, Pid ! {factorialRecorder, Val, IoDevice},State};

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
  io:format("terminating ~p~n", [{global, ?MODULE}]),
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
