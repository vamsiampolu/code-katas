require 'index'

describe 'NumberLetterCount' do
  before(:each) do
    @subject = NumberLetterCount.new
  end

  context 'to_words converts numbers to letters' do
    context 'basic building blocks' do
      it '1 -> one' do
        expect(@subject.to_words(1)).to eq 'one'
      end

      it '2 -> two' do
        expect(@subject.to_words(2)).to eq 'two'
      end

      it '3 -> three' do
        expect(@subject.to_words(3)).to eq 'three'
      end

      it '4 -> four' do
        expect(@subject.to_words(4)).to eq 'four'
      end

      it '5 -> five' do
        expect(@subject.to_words(5)).to eq 'five'
      end

      it '6 -> six' do
        expect(@subject.to_words(6)).to eq 'six'
      end

      it '7 -> seven' do
        expect(@subject.to_words(7)).to eq 'seven'
      end

      it '8 -> eight' do
        expect(@subject.to_words(8)).to eq 'eight'
      end

      it '9 -> nine' do
        expect(@subject.to_words(9)).to eq 'nine'
      end

      it '10 -> ten' do
        expect(@subject.to_words(10)).to eq 'ten'
      end

      it '11 -> eleven' do
        expect(@subject.to_words(11)).to eq 'eleven'
      end

      it '12 -> twelve' do
        expect(@subject.to_words(12)).to eq 'twelve'
      end

      it '13 -> thirteen' do
        expect(@subject.to_words(13)).to eq 'thirteen'
      end

      it '14 -> fourteen' do
        expect(@subject.to_words(14)).to eq 'fourteen'
      end

      it '15 -> fifteen' do
        expect(@subject.to_words(15)).to eq 'fifteen'
      end

      it '16 -> sixteen' do
        expect(@subject.to_words(16)).to eq 'sixteen'
      end

      it '17 -> seventeen' do
        expect(@subject.to_words(17)).to eq 'seventeen'
      end

      it '18 -> eighteen' do
        expect(@subject.to_words(18)).to eq 'eighteen'
      end

      it '19 => nineteen' do
        expect(@subject.to_words(19)).to eq 'nineteen'
      end

      it '20 => twenty' do
        expect(@subject.to_words(20)).to eq 'twenty'
      end

      it '30 => thirty' do
        expect(@subject.to_words(30)).to eq 'thirty'
      end

      it '40 => fourty' do
        expect(@subject.to_words(40)).to eq 'fourty'
      end

      it '50 => fifty' do
        expect(@subject.to_words(50)).to eq 'fifty'
      end

      it '60 => sixty' do
        expect(@subject.to_words(60)).to eq 'sixty'
      end

      it '70 => seventy' do
        expect(@subject.to_words(70)).to eq 'seventy'
      end

      it '80 => eighty' do
        expect(@subject.to_words(80)).to eq 'eighty'
      end

      it '90 => ninety' do
        expect(@subject.to_words(90)).to eq 'ninety'
      end

      it '100 => hundred' do
        expect(@subject.to_words(100)).to eq 'hundred'
      end

      it '1000 => thousand' do
        expect(@subject.to_words(1000)).to eq 'thousand'
      end
    end

    context 'other words using the basic building blocks' do
      it '25 => twentyfive' do
        expect(@subject.to_words(25)).to eq 'twentyfive'
      end

      it '37 => thirtyseven' do
        expect(@subject.to_words(37)).to eq 'thirtyseven'
      end

      # use this test for refactoring, 25 and 37 just added the value, I refactored before the test passed, is that BAD?
      it '48 => fourtyeight' do
        expect(@subject.to_words(48)).to eq 'fourtyeight'
      end

      it '59 => fiftynine' do
        expect(@subject.to_words(59)).to eq 'fiftynine'
      end

      it '115 -> onehundredandfifteen' do
        expect(@subject.to_words(115)).to eq 'onehundredandfifteen'
      end

      it '105 -> onehundredandfive' do
        expect(@subject.to_words(105)).to eq 'onehundredandfive'
      end

      # refactored code here, after writing underlying test
      it '125 => onehundredandtwentyfive' do
        expect(@subject.to_words(125)).to eq 'onehundredandtwentyfive'
      end

      # these three tests went green immediately
      it '307 -> threehundredandseven' do
        expect(@subject.to_words(307)).to eq 'threehundredandseven'
      end

      it '375 -> threehundredandseventyfive' do
        expect(@subject.to_words(375)).to eq 'threehundredandseventyfive'
      end

      it '319 -> threehundredandnineteen' do
        expect(@subject.to_words(319)).to eq 'threehundredandnineteen'
      end
    end
  end

  describe 'num_to_count' do
    context 'it accepts a num and returns a count of characters' do
      # RED -> GREEN
      it '1 => 3' do
        expect(@subject.num_to_count(1)).to eq 3
      end

      # nect two direct GREEN
      it '5 => 4' do
        expect(@subject.num_to_count(5)).to eq 4
      end

      it '21 => 9' do
        expect(@subject.num_to_count(21)).to eq 9
      end
    end
  end

  describe 'main' do
    context 'sums length of all numbers in a range as words' do
      it '(1, 5) => 19' do
        expect(@subject.main(1, 5)).to eq 19
      end

      it '(6, 10) => 20' do
        expect(@subject.main(6,10)).to eq 20
      end
    end
  end
end
