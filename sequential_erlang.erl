-module(sequential_erlang).

-author('mcpaul2058@gmail.com').

-export([convert/1, factorial/1, average/1, sum/1, printAll/1, len/1, double/1, even/1, member/2]).

convert(Day) ->
    case Day of
      monday -> 1;
      tuesday -> 2;
      wednesday -> 3;
      thursday -> 4;
      friday -> 5;
      saturday -> 6;
      sunday -> 7;
      Other -> {error, unknown_day}
    end.
 % Using Guards
 factorial(N) when N > 0 ->
   N * factorial(N - 1);

 factorial(0) -> 1.

average(X) -> sum(X) / len(X).

% Recursion

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

% sumAcc(X) -> sumAcc(X,0);
% sumAcc([], S) -> S;
% sumAcc([H|T], S) -> sumAcc(T, H + S).


len([_|T]) -> 1 + len(T);
len([]) -> 0.

printAll([]) ->
  io:format("~n", []);

printAll([X|Xs]) ->
  io:format("~p", [X]),
printAll(Xs).

% same as above but using tail recursion

% printAll(Ys) ->
%   case Ys of
%     [] ->
%        io:format("~n", []);
%     [X|Xs] ->
%       io:format("~p", [X]),
%       printAll(Xs)
%   end.

% more recursion
% map example
double([H|T]) ->
  [2*H| double(T)];
double([]) ->
  [].

% filter example
even([H|T]) when H rem 2 == 0 ->[H| even(T)];
even([_|T]) -> even(T);
even([]) -> [].

% lookup
member(H, [H|_]) -> true;
member(H, [_|T]) -> member(H, T);
member(_, []) -> false.




