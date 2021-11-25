require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Maths')
    @student = Student.new(age: 59, classroom: @classroom.label, name: 'Kossi', parent_permission: false)
  end

  it ' display classroom instance' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'add details to student array' do
    @classroom.add_student(@student)
    expect(@classroom.students).to include @student
  end

  it 'check student classroom match with class label' do
    expect(@classroom.label).to eql @student.classroom
  end

  it 'checks the size of students array' do
    @student1 = Student.new(age: 69, classroom: @classroom.label, name: 'Yannick', parent_permission: true)
    @classroom.add_student(@student)
    @classroom.add_student(@student1)
    expect(@classroom.students.size).to be 2
  end
end
