Erlang Codes
===========

My collection of erlang codes
Please feel free to improve on codes.
[YouTube Videos](https://www.youtube.com/user/UXLearner)

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
Download and compiling Chicagoboss
~~~


#Client (C#) and Server(Erlang) Socket Application#
Communication between erlang server and c# client using tcp socket.  Commands can be sent from the c# client and executed on erlang.

##How to Run##
~~~
 1.	Using intelliJ import the Socker Server.IML file
 2. Edit configuration and edit directory
 3. Rebuild and Run

 Alternative
 1.	compile the socket_server application
 2. Run erlang with: erl -pa /beam PATH/ -sa socket_server start_server []

 3*/4. Compile the client code using Visual Studios or Mono
 5. Run and execute
~~~

TODO:
~~~
Build a fault tolerant system using gen_server, supervisor and application behaviour
~~~

- Download Chicago boss - (www.chicagoboss.org)
- (Using Windows) Extract and store in (C:\ChicagoBoss-0.8.7)
- Inside the chicagoBoss-0.X.X folder, shift+mouse right click and open command window here
- Compile rebar -> rebar compile
- After -> windows-make
~~~

Running the hello world project
~~~
-First of all make sure that the boss.config file Chicagoboss path is set: (C:\\ChicagoBoss-0.8.7 <---Note double back slash)
-shift+mouse right click on the hello world folder
-Compile rebar -> rebar compile
-After run start-server
-You should see the Erlang console loading up then go to:(localhost:8001)
~~~
