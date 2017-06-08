require "byebug"
class Fixnum

  def in_words
    if self == 0 #zero case
      return "zero"
    elsif self < 10
      UNIT[self]
    elsif self < 20
      TEENS[self]
    elsif self < 100
      self.less_than_hundred
    else
      mag = MAGNITUDES.keys.select { |mag| mag <= self }.max
      mag_words = (self/mag).in_words + " " + MAGNITUDES[mag]
      (self%mag) != 0 ? mag_words + " " + (self%mag).in_words : mag_words
    end
  end

  def less_than_hundred
    unit = self%10
    ten = self-unit
    unit == 0 ? TENS[self] : TENS[ten] + " " + UNIT[unit]
  end

  UNIT = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }
  TEENS = {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
  }
  TENS = {
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  MAGNITUDES = {
    100 => "hundred",
    1000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion"
  }

end
