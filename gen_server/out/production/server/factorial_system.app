%% Copyright

%% Meta data about the application
{application, factorial_system, [
  {description, "Factorial Calculation System - Testing Erlang OTP"},
  {vsn, "1"},
  {modules,      [factorial_logic,server,client,factorial_system,server_supervisor]},
  {registered, []},
  {applications, [kernel,stdlib]},
  {mod, {factorial_system, []}}, %% Entry point  to the application
  {env, []}
]}.