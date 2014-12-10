%% Copyright
-module(factorial_system).
-author("ola").

-behaviour(application).

% application
-export([start/0, start/2, stop/1, stop/0]).


%%% application:stop(factorial_application).
%%% application:start(factorial_application).
start() ->
  application:start(?MODULE).

% application callbacks
start(_Type, _Args) ->
  %% Start top level supervisor
  server_supervisor:start_link().

stop() ->
  application:stop(?MODULE).

stop(_State) ->
  %% Otp will take care of this
  ok.
