-module(calculate).

-author('mcpaul2058@gmail.com').

-export([area/1, area_circle_test/0,
	 area_rectangle_test/0, area_square_test/0]).

area({square, Side}) -> times(Side);
area({circle, Radius}) -> 3.14 * Radius * Radius;
area({rectangle, A, B, C}) ->
    S = (A + B + C) / 2,
    math:sqrt(S * (S - A) * (S - B) * (S - C));
area({Other}) -> {error, invalid_object}.

% private method
times(X) -> X * X.

% unit tests to run erl> eunit:test(calculate).
area_square_test() -> 16 = calculate:area({square, 4}).

area_circle_test() ->
    1.5386e+2 = calculate:area({circle, 7}).

area_rectangle_test() ->
    6.0 = calculate:area({rectangle, 3, 4, 5}).
