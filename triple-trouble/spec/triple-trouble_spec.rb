require 'triple-trouble'

describe 'TripleTrouble' do

  before(:each) do
    @subject = TripleTrouble.new
  end

  describe '#main()' do
    context 'returns 1 if num1 has triple and num2 has double of same digit' do
      it 'returns 1 for 999 and 99' do
        num1 = 999
        num2 = 99
        expect(@subject.main(num1, num2)).to eq 1
      end


      it 'return 1 for 666 and 166' do
        num1 = 666
        num2 = 166
        expect(@subject.main(num1, num2)).to eq 1
      end

      it 'return 1 for 2345333 and 12356337' do
        num1 = 2345333
        num2 = 12356337
        expect(@subject.main(num1, num2)).to eq 1
      end

      it 'returns 1 for 333444, 124435' do
        num1 = 333444
        num2 = 124435
        expect(@subject.main(num1, num2)).to eq 1
      end

      #NOT FAILING TEST
      it 'returns 1 for 451999277, 41177722899' do
        num1 = 451999277
        num2 = 41177722899
        expect(@subject.main(num1, num2)).to eq 1
      end
    end

    context 'returns 0 if conditions are not met' do
      it 'returns 0 for 999 and 77' do
        num1 = 999
        num2 = 77
        expect(@subject.main(num1, num2)).to eq 0
      end

      # NOT FAILING TESTS
      it 'returns 0 for 12345, 12345' do
        num1 = 12345
        num2 = 12345
        expect(@subject.main(num1, num2)).to eq 0
      end

      it 'returns 0 for hello, goodbye' do
        num1 = 'hello'
        num2 = 'goodbye'
        expect(@subject.main(num1, num2)).to eq 0
      end

      it 'returns 0 for nil, nil' do
        num1 = nil
        num2 = nil
        expect(@subject.main(num1, num2)).to eq 0
      end
    end
  end
end

