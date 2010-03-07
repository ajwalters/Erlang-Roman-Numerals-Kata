-module(arabic_to_roman).

-compile(export_all).

convert(ArabicNumber) ->
  case reserved_numeral(ArabicNumber) of
    nomatch ->
      build_by_addition(ArabicNumber);
    Reserved ->
      Reserved
  end.

build_by_addition(Integer) ->
  build_by_addition(Integer, "").

build_by_addition(0, Builder) ->
  Builder;

build_by_addition(Integer, Builder) ->
  {RomanValue, Remainder} = case integer_to_list(Integer) of
    "4" ++ _TrailingNumbers ->
      four_based_subtraction(Integer);
    "9" ++ _TrailingNumbers ->
      nine_based_subtraction(Integer);
    _ ->
      base_for_addition(Integer)
  end,
  build_by_addition(Remainder, string:concat(Builder, RomanValue)).

nine_based_subtraction(Integer) ->
  if
    Integer =< 9 ->
      {"IX", Integer - 9};
    Integer >= 90, Integer =< 99 ->
      {"XC", Integer - 90};
    Integer >= 900, Integer =< 999 ->
      {"CM", Integer - 900}
  end.

four_based_subtraction(Integer) ->
  if
    Integer =< 4 ->
      {"IV", Integer - 4};
    Integer >= 40, Integer =< 49 ->
      {"XL", Integer - 40};
    Integer >= 400, Integer =< 499 ->
      {"CD", Integer - 400}
  end.


base_for_addition(Integer) ->
  if
    Integer >= 1000 ->
      {reserved_numeral(1000), Integer - 1000};
    Integer >= 500 ->
      {reserved_numeral(500), Integer - 500};
    Integer >= 100 ->
      {reserved_numeral(100), Integer - 100};
    Integer >= 50 ->
      {reserved_numeral(50), Integer - 50};
    Integer >= 10 ->
      {reserved_numeral(10), Integer - 10};
    Integer >= 5 ->
      {reserved_numeral(5), Integer - 5};
    true ->
      {reserved_numeral(1), Integer - 1}
  end.

reserved_numeral(Integer) ->
  case Integer of
    1 -> "I";
    5 -> "V";
    10 -> "X";
    50 -> "L";
    100 -> "C";
    500 -> "D";
    1000 -> "M";
    _ -> nomatch
  end.

