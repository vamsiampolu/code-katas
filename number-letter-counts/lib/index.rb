class NumberLetterCount
  NUM_WORDS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'fourty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety',
    100 => 'hundred',
    1000 => 'thousand'
  }

  def to_words(num)
    # base case
    return NUM_WORDS[num] if NUM_WORDS.has_key?(num)
    if num > 20 and num < 100
      closest_ten_mul = (num / 10) * 10
      remaining = num - closest_ten_mul
      return (to_words(closest_ten_mul) + to_words(remaining))
    end
    if num > 100 and num < 1000
      quotient = num / 100
      closest_hundred_mul = quotient * 100
      remaining = num - closest_hundred_mul
       return (to_words(quotient) + to_words(100) + 'and' + to_words(remaining))
    end
  end

  def num_to_count(num)
    words = to_words(num)
    words.length
  end

  def main(first, last)
    numbers = first..last
    # &:num_to_count did not work
    counts = numbers.map{ |num| num_to_count(num)}
    result = counts.reduce(0,:+)
    result
  end
end
