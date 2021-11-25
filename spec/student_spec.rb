require_relative '../student'
require_relative '../classroom'
require_relative '../person'

describe Student do
  before(:each) do
    @classroom = Classroom.new('Chemistry')
    @student = Student.new(age: 19, classroom: @classroom.label, name: 'Ali', parent_permission: false)
  end

  it ' show student instance' do
    expect(@student).to be_instance_of Student
  end

  it 'show student inheritance' do
    expect(@student).to be_kind_of Person
  end

  it 'play_hooky not to be correct' do
    expect(@student.play_hooky).not_to match '/()/'
  end

  it 'match classroom value' do
    expect(@student.classroom).to eql @classroom.label
  end
end
