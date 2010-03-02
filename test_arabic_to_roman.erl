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
