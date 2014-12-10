%% Copyright
-module(server_supervisor).
-author("LAB314").

%% Supervisor restarts the process that fails
-behaviour(supervisor).

%% API
-export([start_link_shell/0,start_link/0]).

%% supervisor
-export([init/1]).

%%% convenience method for startup
start_link_shell() ->
  %%% supervisor process is linked to the shell process.
  %%% When gen_server process crashes the exit signal is propagated
  %%% up to the shell which crashes and get restarted.
  {ok, Pid} = supervisor:start_link({global, ?MODULE}, ?MODULE, []),
  unlink(Pid).

start_link() ->
  supervisor:start_link({global,?MODULE}, ?MODULE, []).

%%% supervisor callback
init([]) ->
  process_flag(trap_exit, true),
  %%% supervisor:which_children(server_supervisor).
  %%% supervisor:terminate_child(server_supervisor,serverId).
  io:format("~p (~p) starting...~n", [{global,?MODULE}, self()]),

%%% If MaxRestarts restarts occur in MaxSecondsBetweenRestarts seconds
%%% supervisor and child processes are killed
RestartStrategy = one_for_one,
MaxRestarts = 3,                  % 3 restart within
MaxSecondsBetweenRestarts = 5,    % five seconds
Flags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

%%% permanent - always restart
%%% temporary - never restart
%%% transient - restart if abnormally ends
Restart = permanent,

%%%brutal_kill - use exit(Child, kill) to terminate
%%%integer - use exit(Child, shutdown) - milliseconds
Shutdown = infinity,

%%% worker
%%% supervisor
Type = worker,

%% Modules ones supervisor uses
%%% {ChildId, {StartFunc - {module,function,arg}, Restart, Shutdown, Type, Modules}.
Server = {serverId, {server, start_link, []},
Restart, Shutdown, Type, [server]},

%%% tuple of restart strategy, max restart and max time
%%% child specification
{ok, {Flags, [Server]}}.