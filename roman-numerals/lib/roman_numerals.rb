class RomanNumerals
  def get_digits(num)
    result = []
    if num < 10
      digit = num % 10
      result = [digit] + result
    else
      digit = num % 10
      num = num / 10
      result =  get_digits(num) + [digit]
    end
    result
  end

  GLYPHS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def convert(num)
    result = ''
    return GLYPHS[num] unless GLYPHS[num].nil?
    digits = get_digits(num)

    if digits.length > 1
    digits.reverse!
    end

    digits.each_with_index.map do |d, i|
      place = 10 ** i

      if d < 4
        result = GLYPHS[place] * d + result
      end

      if d == 4 or d == 9
        val = (d + 1) * place
        result = GLYPHS[place] + GLYPHS[val] + result
      end

      if d > 4 and d < 9
        val = d - 5
        five_num = 5 * place
        result = GLYPHS[five_num] + GLYPHS[place] * val + result
      end

    end

    result
  end

end
