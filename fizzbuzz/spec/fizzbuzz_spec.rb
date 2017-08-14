require 'fizzbuzz'

describe 'FizzBuzz' do
  context 'divisible by' do
    it '3' do
      expect(is_divisible_by_three?(3)).to be true
    end

    it '5' do
      expect(is_divisible_by_five?(5)).to be true
    end

    it '15' do
      expect(is_divisible_by_fifteen?(15)).to be true
    end
  end

  context 'not divisible by' do
    it '3' do
      expect(is_divisible_by_three?(4)).not_to be true
    end

    it '5' do
      expect(is_divisible_by_five?(4)).not_to be true
    end

    it '15' do
      expect(is_divisible_by_fifteen?(4)).not_to be true
    end
  end

  context 'when playing the game, given the number, return' do
    it 'the number' do
      expect(fizzbuzz(1)).to eq 1
    end

    it '3 -> Fizz' do
      expect(fizzbuzz(3)).to eq 'Fizz'
    end

    it '12 -> Fizz' do
      expect(fizzbuzz(12)).to eq 'Fizz'
    end

    it '5 -> Buzz' do
      expect(fizzbuzz(5)).to eq 'Buzz'
    end

    it '25 -> Buzz' do
      expect(fizzbuzz(25)).to eq 'Buzz'
    end

    it '15 -> FizzBuzz' do
      expect(fizzbuzz(15)).to eq 'FizzBuzz'
    end

    it '45 -> FizzBuzz' do
      expect(fizzbuzz(45)).to eq 'FizzBuzz'
    end
  end
end
