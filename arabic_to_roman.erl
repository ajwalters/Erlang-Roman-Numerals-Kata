-module(arabic_to_roman).

-compile(export_all).

convert(ArabicNumber) ->
  case reserved_numeral(ArabicNumber) of
    nomatch ->
      build_by_addition(ArabicNumber);
    Reserved ->
      Reserved
  end.

build_by_addition(Numeral) ->
  {RomanNumeralBase, Remainder} = base_for_addition(Numeral),
  build_by_addition(Remainder, RomanNumeralBase).

build_by_addition(0, RomanBuilder) ->
  RomanBuilder;

build_by_addition(Numeral, RomanBuilder) ->
  build_by_addition(Numeral - 1, string:concat(RomanBuilder, "I")).

base_for_addition(Numeral) ->
  if
    Numeral > 1000 ->
      {reserved_numeral(1000), Numeral - 1000};
    Numeral > 500 ->
      {reserved_numeral(500), Numeral - 500};
    Numeral > 100 ->
      {reserved_numeral(100), Numeral - 100};
    Numeral > 50 ->
      {reserved_numeral(50), Numeral - 50};
    Numeral > 10 ->
      {reserved_numeral(10), Numeral - 10};
    Numeral > 5 ->
      {reserved_numeral(5), Numeral - 5};
    true ->
      {reserved_numeral(1), Numeral - 1}
  end.

reserved_numeral(Numeral) ->
  case Numeral of
    1 -> "I";
    5 -> "V";
    10 -> "X";
    50 -> "L";
    100 -> "C";
    500 -> "D";
    1000 -> "M";
    _ -> nomatch
  end.

