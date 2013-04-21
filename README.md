Erlang Codes
===========
My collection of erlang codes

creating a node
	#change directory to the erlang bin directory.
	using CLI type werl or erl -name or -sname foo@?.?.?.? or foo -setcookie ???

add to code path (example)
~~~erlang
code:add_patha("C:/Users/user/Documents/GitHub/ErlangCodes/factorial/ebin").
~~~

### factorial ###
usage example
~~~erlang
server:start().
server:rpc({factorial, 5}).
server.stop().
~~~