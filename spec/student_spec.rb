require_relative '../rental'
require_relative '../teacher'
require_relative '../student'
require_relative '../book'
require_relative '../classroom'

describe student do
    before(:each) do
      @book = Book.new(title: 'Harry Potter', author: 'RG Rowlings')
      @classroom = Classroom.new('Maths')
      @student = Student.new(age: 19, classroom: @classroom.label, name: 'Ali', parent_permission: false)
      @teacher = Teacher.new(age: 45, specialization: 'Maths', name: 'Mr Rajesh')
    end
    