-module(sequential_erlang2).
-author('mcpaul2058@gmail.com').
-export([date_today/0, the_time_now/0, add/2]).
% BIF
date_today() ->
  date().

the_time_now() ->
  time().

add(X,Y) ->
  test(Y),
  test(X),
  X + Y.

test(X) when is_integer(X) -> ok;
test(X) -> throw({error, {non_integer, X}}).