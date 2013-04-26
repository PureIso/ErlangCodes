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