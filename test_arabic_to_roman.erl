-module(test_arabic_to_roman).

-include_lib("eunit/include/eunit.hrl").

seven_key_symbols_test_() ->
  [ ?_assertEqual("I", arabic_to_roman:convert(1)),
    ?_assertEqual("V", arabic_to_roman:convert(5)),
    ?_assertEqual("X", arabic_to_roman:convert(10)),
    ?_assertEqual("L", arabic_to_roman:convert(50)),
    ?_assertEqual("C", arabic_to_roman:convert(100)),
    ?_assertEqual("D", arabic_to_roman:convert(500)),
    ?_assertEqual("M", arabic_to_roman:convert(1000))].

% This tests that roman numerals that are built from left
% to right adding the characters can be built
% eg- III, VI, DIII, etc
convert_roman_numerals_based_on_addition_test_() ->
  [ ?_assertEqual("II", arabic_to_roman:convert(2)),
    ?_assertEqual("III", arabic_to_roman:convert(3)),
    ?_assertEqual("VI", arabic_to_roman:convert(6)),
    ?_assertEqual("VII", arabic_to_roman:convert(7)),
    ?_assertEqual("DIII", arabic_to_roman:convert(503))].
