Erlang Codes
===========
My collection of erlang codes
Please feel free to improve on codes.

~~~
-Run the erlangRunner.bat file as admin to compile and run the application
-Run the compiler.bat to compile the source files
-Server will auto start
(NB) .bat file has to be edited to suit.
~~~

Installing Erlang on ubuntu linux
~~~
sudo apt-get install erlang erlang-doc
~~~

### factorial - Example of distributed programming across multiple nodes###
usage example
~~~erlang
%%Register your node
server:register(node()). 
%% call factorial function 
server:rpc({factorial, node(),5}).
%% stop your current node and unregister
server.stop(node()).
~~~

RPC multi node example
~~~erlang
%% Register your node
rpc:call(node(),server,register,[node()]). 
%% call factorial function 
rpc:call(node(),server,rpc,[{factorial,node(),6}]). 
%% stop your current node and unregister
rpc:call(node(),server,stop,[node()]). 
~~~

### GenServerTutorial - Learning how to use gen_server ,supervisor and application###
usage example
~~~
Run the erlangRunner.bat file
factorial_system should start with it
If the application crashes the supervisor should reload it
~~~

Commands
~~~erlang
%%Send request as the client
client:factorial(5).
%% How to stop the application
application:stop(factorial_system).
%% Check if the application is still running
application:which_applications().
%% intensionally crash the app to restart supervisior but doesn't work needs fix
client:factorial(an).
~~~

### Chicagoboss Hello World - Using chicagoboss framework###
~~~Download and compiling Chicagoboss
-Download Chicago boss - http://www.chicagoboss.org/
-(Using Windows) Extract and store in C:\ChicagoBoss-0.8.7
-Inside the chicagoBoss-0.X.X folder, shift+mouse right click and open command window here
-Compile rebar -> rebar compile
-After -> windows-make
~~~

~~~Running the hello world project
-First of all make sure that the boss.config file Chicagoboss path is set: C:\\ChicagoBoss-0.8.7 <---Note double back slash
-shift+mouse right click on the hello world folder
-Compile rebar -> rebar compile
-After run start-server
-You should see the Erlang console loading up then go to: http://localhost:8001/
~~~