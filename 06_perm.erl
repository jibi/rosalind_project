-module(perm).
-export([perm/1, printL/1, main/1]).

perm([]) -> 
	[[]];
perm(L)	 -> 
	[[H|T] || H <- L, T <- perm(L -- [H])].

printL([]) ->
	io:format("~n");
printL([H|T]) ->
	io:format("~p ", [H]), printL(T).

main(N) when N < 1; N > 7 -> 
	false;
main(N) ->
	L = perm(lists:seq(1,N)),
	lists:foreach(fun(X) -> printL(X) end, L).

