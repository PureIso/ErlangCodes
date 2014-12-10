-module(main).
-author("ola").
-export([create_file/1,read_file/1]).

%%main:create_file("Test.txt").
create_file(FileName) ->
  {ok, IODevice} = file:open(filename:absname("")++"/"++FileName,write),
  io:format(IODevice,"~s ~n",["Hello World"]),
  file:close(IODevice).

%%main:read_file("Test.txt").
read_file(FileName) ->
  {ok, IODevice} = file:open(filename:absname("")++"/"++FileName,read),
  try print_line(IODevice)
  after file:close(IODevice)
  end.

%% Private Function
print_line(IODevice) ->
  case io:get_line(IODevice, "") of
    eof  -> io:format("",[]);
    Line ->
      io:format("~s",[Line]),
      print_line(IODevice)
  end.