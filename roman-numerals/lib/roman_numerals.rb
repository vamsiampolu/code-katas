class RomanNumerals
  #constant, maps all known number => symbol
  TO_GLYPH = {
    1 => 'I',
    9 => 'IX',
    5 => 'V',
    10 => 'X',
    50 => 'L'
  }

  WELL_KNOWN_SYMBOLS = [1, 5, 9, 10, 50]

  def convert(number)

    result = ''

    #find smallest WKS larger than number
    if number > 1
      smallest = WELL_KNOWN_SYMBOLS.find do |num|
        num > number
      end

      # find largest WKS smaller than number
      largest_index = WELL_KNOWN_SYMBOLS.find_index do |num|
        num > number
      end

      largest_index = largest_index - 1

      # find the diff between number and largest
      largest =  WELL_KNOWN_SYMBOLS[largest_index]
      rem  = smallest - number

      # if the difference is smaller than the largest,
      # go <largest><smallest>
      if rem > 0 and rem <= largest
        result = result + TO_GLYPH[largest] + TO_GLYPH[smallest]
      end

      if rem < largest
        number = rem
      end

    end

    print 'Smallest '
    puts smallest
    print 'Largest '
    puts largest
    print 'Rem'
    puts rem

    if number > 50
      result = result + TO_GLYPH[50]
      number  = number - 50
    end

    if number > 10 and number < 50
      times = number / 10
      rem = number % 10
      result = result + TO_GLYPH[10] * times
      number = rem
    end

    if WELL_KNOWN_SYMBOLS.include?(number)
      result = result + TO_GLYPH[number]
    end




    if number > 5 and number < 9
      result = result + TO_GLYPH[5]
      number = number - 5
    end

    if number < 4
      result =  result + TO_GLYPH[1] * number
    end

    result
  end
end
