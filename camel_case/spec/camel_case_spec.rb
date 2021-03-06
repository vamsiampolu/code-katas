require 'camel_case'

describe 'CamelCase' do
  before(:each) do
    @subject = CamelCase.new
  end

  context 'must convert if _ in the middle' do
    it 'super_mario -> superMario' do
      expect(@subject.convert('super_mario')).to eq 'superMario'
    end

    it 'eslint_path -> eslintPath' do
      expect(@subject.convert('eslint_path')).to eq 'eslintPath'
    end

    it 'eslint_global_path -> eslintGlobalPath' do
      expect(@subject.convert('eslint_global_path')).to eq 'eslintGlobalPath'
    end

    it 'goat__mustache -> goatMustache' do
      expect(@subject.convert('goat__mustache')).to eq 'goatMustache'
    end

    # Regex evolved to handle this seperately here
    # http://rubular.com/r/g3pUxyd306
    it 'dressing___down -> dressingDown' do
      expect(@subject.convert('dressing___down')).to eq 'dressingDown'
    end

    # This test took much longer to go green
    # I realize that the solution to the problem
    # has been overcomplicated, how to simplify here
    it 'eslint__global__goat___mustache___path -> eslintGlobalGoatMustachePath' do
      input = 'eslint__global__goat___mustache___path'
      output = 'eslintGlobalGoatMustachePath'
      expect(@subject.convert(input)).to eq output
    end
  end

  context 'dont convert if _ in the start/end' do
    it '_pungent -> _pungent' do
      expect(@subject.convert('_pungent')).to eq '_pungent'
    end

    it '__proto -> __proto' do
      expect(@subject.convert('__proto')).to eq '__proto'
    end

    it 'prop_ -> prop_' do
      expect(@subject.convert('prop_')).to eq 'prop_'
    end

    # Refactoring started after this test passed.
    # Regex created: http://rubular.com/r/BmXO7arDxv
    it 'prop__ -> prop__' do
      expect(@subject.convert('prop__')).to eq 'prop__'
    end
  end

  context 'must convert if - in the middle' do
    it 'super-mario -> superMario' do
      expect(@subject.convert('super-mario')).to eq 'superMario'
    end

    it 'eslint-path -> eslintPath' do
      expect(@subject.convert('eslint-path')).to eq 'eslintPath'
    end

    # Another test that drove me nuts, helped fix an important
    # bug, though. Made me happy
    #http://rubular.com/r/XItF49LXOo
    it 'eslint-global-path -> eslintGlobalPath' do
      expect(@subject.convert('eslint-global-path')).to eq 'eslintGlobalPath'
    end

    it 'goat--mustache -> goatMustache' do
      expect(@subject.convert('goat--mustache')).to eq 'goatMustache'
    end

    it 'dressing---down -> dressingDown' do
      expect(@subject.convert('dressing---down')).to eq 'dressingDown'
    end

    it 'eslint--global--goat---mustache---path -> eslintGlobalGoatMustachePath' do
      input = 'eslint--global--goat---mustache---path'
      output = 'eslintGlobalGoatMustachePath'
      expect(@subject.convert(input)).to eq output
    end
  end

  context 'dont convert if - in the start/end' do
    it '-pungent -> -pungent' do
      expect(@subject.convert('-pungent')).to eq '-pungent'
    end

    it '--proto -> --proto' do
      expect(@subject.convert('--proto')).to eq '--proto'
    end

    it 'prop- -> prop-' do
      expect(@subject.convert('prop-')).to eq 'prop-'
    end

    # Refactoring started after this test passed.
    # Regex created: http://rubular.com/r/BmXO7arDxv
    it 'prop-- -> prop--' do
      expect(@subject.convert('prop--')).to eq 'prop--'
    end
  end
end
