require_relative '../corrector'

describe Corrector do
  it 'check corrector instance class' do
    corrector = Corrector.new
    expect(corrector).to be_instance_of Corrector
  end

  it 'validate name to correct format' do
    correct = Corrector.new
    name = 'yannick'
    expect(correct.correct_name(name)).to match 'Yannick'
  end

  it 'validate nil values' do
    correct = Corrector.new
    expect(correct.correct_name('')).to eql ''
  end
end
