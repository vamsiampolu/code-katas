require 'roman_numerals'
describe 'RomanNumerals' do
  before(:each) do
    @subject = RomanNumerals.new
  end

  context 'converts from the number' do
    it '1 to I' do
      expect(@subject.convert(1)).to eq 'I'
    end

    it '2 to II' do
      expect(@subject.convert(2)).to eq 'II'
    end

    it '3 to III' do
      expect(@subject.convert(3)).to eq 'III'
    end

    it '5 to V' do
      expect(@subject.convert(5)).to eq 'V'
    end

    it '4 to IV' do
      expect(@subject.convert(4)).to eq 'IV'
    end

    it '6 to VI' do
      expect(@subject.convert(6)).to eq 'VI'
    end

    it '10 to X' do
      expect(@subject.convert(10)).to eq 'X'
    end

    it '9 to IX' do
      expect(@subject.convert(9)).to eq 'IX'
    end

    it '20 to XX' do
      expect(@subject.convert(20)).to eq 'XX'
    end

    it '23 to XXIII' do
      expect(@subject.convert(23)).to eq 'XXIII'
    end

    it '29 to XXIX' do
      expect(@subject.convert(29)).to eq 'XXIX'
    end

    # only uses well known symbols
    it '35 to XXXV' do
      expect(@subject.convert(35)).to eq 'XXXV'
    end

    it '50 to L' do
      expect(@subject.convert(50)).to eq 'L'
    end

    # only uses well known symbols
    it '54 to LIV' do
      expect(@subject.convert(54)).to eq 'LIV'
    end

    it '53 to LIII' do
      expect(@subject.convert(53)).to eq 'LIII'
    end

    it '57 to LVII' do
      expect(@subject.convert(57)).to eq 'LVII'
    end

    it '68 to LXVIII' do
      expect(@subject.convert(68)).to eq 'LXVIII'
    end

  end
end
