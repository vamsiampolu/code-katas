require  'roman_numerals'

describe 'RomanNumerals' do
  before(:each) do
    @roman = RomanNumerals.new
  end

  context '#getDigits' do

    it '1 -> [1]' do
      expect(@roman.get_digits(1)).to eq [1]
    end

    it '2 -> [2]' do
      expect(@roman.get_digits(2)).to eq [2]
    end

    it '11 -> [1,1]' do
      expect(@roman.get_digits(11)).to eq [1,1]
    end

    it '0 -> [0]' do
      expect(@roman.get_digits(0)).to eq [0]
    end

    it '10 -> [1,0]' do
      expect(@roman.get_digits(10)).to eq [1,0]
    end

    it '21 -> [2,1]' do
      expect(@roman.get_digits(21)).to eq [2,1]
    end

    it '201 -> [2,0,1]' do
      expect(@roman.get_digits(201)).to eq [2,0,1]
    end
  end

  context '#convert' do

    context 'known symbols' do
      it '1 -> [I]' do
        expect(@roman.convert(1)).to eq 'I'
      end

      it '5 -> V' do
        expect(@roman.convert(5)).to eq 'V'
      end

      it '10 -> X' do
        expect(@roman.convert(10)).to eq'X'
      end

      it '50 -> L' do
        expect(@roman.convert(50)).to eq 'L'
      end

      it '100 -> C' do
        expect(@roman.convert(100)).to eq 'C'
      end

      it '500 -> D' do
        expect(@roman.convert(500)).to eq 'D'
      end

      it '1000 -> M' do
        expect(@roman.convert(1000)).to eq 'M'
      end

    end

    context 'one digit less than known symbol' do

      it '4 -> IV' do
        expect(@roman.convert(4)).to eq 'IV'
      end

      it '9 -> IX' do
        expect(@roman.convert(9)).to eq 'IX'
      end

      it '40 -> XL' do
        expect(@roman.convert(40)).to eq 'XL'
      end

      it '90 -> XC' do
        expect(@roman.convert(90)).to eq 'XC'
      end

      context 'combinations for multiple places' do
        it '49 -> XLIX' do
          expect(@roman.convert(49)).to eq 'XLIX'
        end

        it '44 -> XLIV' do
          expect(@roman.convert(44)).to eq 'XLIV'
        end

        it '94 -> XCIV' do
          expect(@roman.convert(94)).to eq 'XCIV'
        end

        it '99 -> XCIX' do
          expect(@roman.convert(99)).to eq 'XCIX'
        end

      end

    end

    context 'numbers with digits below 4' do
      it ' 2 -> II' do
        expect(@roman.convert(2)).to eq 'II'
      end

      it '13 -> XIII' do
        expect(@roman.convert(13)).to eq 'XIII'
      end

      it '43 -> XLIII' do
        expect(@roman.convert(43)).to eq 'XLIII'
      end

      it '92 -> XCII' do
        expect(@roman.convert(92)).to eq 'XCII'
      end

      it '24 -> XXIV' do
        expect(@roman.convert(24)).to eq 'XXIV'
      end

      it '29 -> XXIX' do
        expect(@roman.convert(29)).to eq 'XXIX'
      end

    end

    context 'numbers with digits between 4 and 9' do
      it ' 7 -> VII' do
        expect(@roman.convert(7)).to eq 'VII'
      end

      it '18 -> XVIII' do
        expect(@roman.convert(18)).to eq 'XVIII'
      end

      it '47 -> XLVII' do
        expect(@roman.convert(47)).to eq 'XLVII'
      end

      it '73 -> LXXIII' do
        expect(@roman.convert(73)).to eq 'LXXIII'
      end

      it '77 -> LXXVII' do
        expect(@roman.convert(77)).to eq 'LXXVII'
      end

    end

    context 'numbers with 0 as a digit' do
      it '104 -> CIV' do
        expect(@roman.convert(104)).to eq 'CIV'
      end

      it '140 -> CXL' do
        expect(@roman.convert(140)).to eq 'CXL'
      end

      it '1040 => MXL' do
        expect(@roman.convert(1040)).to eq 'MXL'
      end

    end

  end
end
