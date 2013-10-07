-module(helloworld_about_controller,[Req]).
-export([about/2]).

about('GET',[]) ->
	{ok, 
		[
			{msg,"Welcome to the about page!!"},
			{the_title,"About Page"}
		]
	}.