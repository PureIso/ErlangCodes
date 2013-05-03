%% Copyright

%% Meta data about the application
{application, factorial_application, [
  {description, "Factorial Calculation System - Testing Erlang OTP"},
  {vsn, "1"},
  {modules,      [server,client,factorial_application,server_supervisor]},
  {registered, []},
  {applications, [kernel,stdlib]},
  {mod, {factorial_application, []}}, %% Entry point  to the application
  {env, []}
]}.