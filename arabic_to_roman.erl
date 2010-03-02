-module(arabic_to_roman).

-compile(export_all).

convert(ArabicNumber) ->
  case ArabicNumber of
    1 -> "I";
    5 -> "V";
    10 -> "X";
    50 -> "L";
    100 -> "C";
    500 -> "D";
    1000 -> "M"
  end.
