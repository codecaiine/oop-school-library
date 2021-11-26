require_relative '../teacher'

describe teacher do
  it 'check teacher instance class' do
    teacher = teacher.new
    expect(teacher).to be_instance_of teacher
  end

  it 'validate name to correct format' do
    correct = teacher.new
    name = 'yannick'
    expect(correct.correct_name(name)).to match 'Yannick'
  end

  it 'validate nil values' do
    correct = teacher.new
    expect(correct.correct_name('')).to eql ''
  end
end
