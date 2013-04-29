%% Copyright
-module(server_supervisor).
-author("LAB314").

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% supervisor
-export([init/1]).

%%% convenience method for startup
start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%% supervisor callback
init([]) ->
  process_flag(trap_exit, true),
  io:format("~p (~p) starting...~n", [?MODULE, self()]),
  RestartStrategy = one_for_one,
  MaxRestarts = 3, % one restart every
  MaxSecondsBetweenRestarts = 5, % five seconds
  SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},
  Restart = permanent, % or temporary, or transient
  Shutdown = 2000, % milliseconds, could be infinity or brutal_kill
  Type = worker, % could also be supervisor
  %% Module
  %%% {ChildId, {StartFunc - {module,function,arg}, Restart, Shutdown, Type, Modules}.
  Server = {server, {server, start_link, []},
    Restart, Shutdown, Type, [server]},
  %%% tuple of restart strategy, max restart and max time
  %%% child specification
  {ok, {SupFlags, [Server]}}.