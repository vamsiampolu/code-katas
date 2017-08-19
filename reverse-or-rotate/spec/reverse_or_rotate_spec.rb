require 'reverse_or_rotate'

describe 'Reverse or Rotate' do

  before(:each) do
    @revRot = RevRot.new
  end

  context 'break_input' do
    it 'result is empty str if input size < chunk size' do
      expect(@revRot.break_input('123', 6)).to be_nil
    end

    it 'result is single chunk if input size = chunk size' do
      expect(@revRot.break_input('123456', 6)).to eq ['123456']
    end

    it 'result is 2 chunks if input can have multiple chunks' do
      expect(@revRot.break_input('123456', 3)).to eq ['123', '456']
    end

    #not written as a failing test
    it 'ignores all remaining chunks smaller than size' do
      expect(@revRot.break_input('12345678', 3)).to eq ['123', '456']
    end

    it 'ignores whitespace in the input' do
      expect(@revRot.break_input('123456    ', 3)).to eq ['123', '456']
    end

  end

  context 'convert_chunk_to_numbers' do

    context 'returns nil if input is not a string of numbers' do

      it "nil -> nil" do
        expect(@revRot.convert_chunk_to_numbers(nil)).to be_nil
      end

      it '123 -> nil' do
        expect(@revRot.convert_chunk_to_numbers(123)).to be_nil
      end

      it "'gibberish' -> nil" do
        expect(@revRot.convert_chunk_to_numbers('gibberish')).to be_nil
      end

    end

    context 'converts a string of numbers to a list of numbers' do

      it "'123' -> [1,2,3]" do
        expect(@revRot.convert_chunk_to_numbers('123')).to eq [1,2,3]
      end

      it "'13456' -> [1,3,4,5,6]" do
        expect(@revRot.convert_chunk_to_numbers('13456')).to eq [1, 3, 4, 5, 6]
      end

    end

  end

  context 'sum_of_cubes' do

    it 'nil -> nil' do
      expect(@revRot.sum_of_cubes(nil)).to be_nil
    end

    it "['a', b'] -> ab" do
      expect(@revRot.sum_of_cubes(['a', 'b'])).to be_nil
    end

    it '[1, 2, 3] -> 36' do
      expect(@revRot.sum_of_cubes([1,2,3])).to eq 36
    end

    it '[1,2,3,0,4] -> 100' do
      expect(@revRot.sum_of_cubes([1,2,3, 0, 4])).to eq 100
    end

  end

  context 'rotate_left' do
    context 'handles invalid input' do
      # not a failing test OOPS
      it 'nil -> nil' do
        expect(@revRot.rotate_left(nil)).to be_nil
      end

      it "'str' -> nil" do
        expect(@revRot.rotate_left('str')).to be_nil
      end

      #BAD - wrote implementation before the test
      it "['1', '2', '3'] -> nil" do
        expect(@revRot.rotate_left(['1', '2', '3'])).to be_nil
      end
    end

    context 'handles valid input' do

      #BAD changed test after finishing implementation
      it '[1,2,3] -> [2,3,1]' do
        expect(@revRot.rotate_left([1,2,3])).to eq [2,3,1]
      end

      it '[1,2,3,4,5,6] -> [2,3,4,5,6, 1]' do
        expect(@revRot.rotate_left([1,2,3,4,5,6])).to eq [2,3,4,5,6,1]
      end
    end
  end

  context 'main' do
    # All tests here are from problem description in codewars
    it 'str is 123123 and sz is 3 -> 321321' do
      expect(@revRot.main('123123', 3)).to eq '321321'
    end

    it 'str is 66443875, sz is 4 -> 44668753' do
      expect(@revRot.main('66443875', 4)).to eq '44668753'
    end

    # I solved the problem before writing this test, the
    # rest of the tests did not go through RED -> GREEN -> REFACTOR, instead they just went green
    it 'str is 123456987653, sz is 6 -> 234561356789' do
      expect(@revRot.main('123456987653', 6)).to eq '234561356789'
    end

    it 'str is 66443875, sz is 8 -> 64438756' do
      expect(@revRot.main('66443875', 8)).to eq '64438756'
    end

    it 'str is 664438769, sz is 8 -> 67834466' do
      expect(@revRot.main('664438769', 8)).to eq '67834466'
    end

    it 'str is 123456779, sz is 8 -> 23456771' do
      expect(@revRot.main('123456779', 8)).to eq '23456771'
    end

    # Finally a failing test
    it 'str is "", sz is 8 -> ""' do
      expect(@revRot.main('', 8)).to eq ''
    end

    it 'str is "123456779", sz is 0 -> ""' do
      expect(@revRot.main('123456779', 0)).to eq ''
    end

    # Just went green, no RED state
    it 'str is 563000655734469485, sz is 4 -> 0365065073456944' do
      expect(@revRot.main('563000655734469485', 4)).to eq '0365065073456944'
    end
  end

end
