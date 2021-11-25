require_relative '../rental'
require_relative '../teacher'
require_relative '../student'
require_relative '../book'
require_relative '../classroom'

describe Rental do
  before(:each) do
    @book = Book.new(title: 'Harry Potter', author: 'RG Rowlings')
    @classroom = Classroom.new('Maths')
    @student = Student.new(age: 19, classroom: @classroom.label, name: 'Ali', parent_permission: false)
    @teacher = Teacher.new(age: 45, specialization: 'Maths', name: 'Mr Rajesh')
    @rental_a = Rental.new('2021/11/11', @student, @book)
    @rental_b = Rental.new('2021/12/25', @teacher, @book)
  end

  it 'show rental instance' do
    expect(@rental_a).to be_instance_of Rental
  end

  it 'verify student rental date student' do
    expect(@rental_a.date).to match '2021/11/11'
  end

  it 'verify person (student) who added a rental' do
    expect(@rental_a.person).to be_instance_of Student
  end

  it 'verify teacher rental date ' do
    expect(@rental_b.date).not_to match '2011/12/25'
  end

  it 'verify person (teacher) who added a rental' do
    expect(@rental_b.person).to be_instance_of Teacher
  end

  it 'expects students to be in rental array' do
    expect(@student.rentals).to include @rental_a
  end

  it 'expects teacher to be in rental array' do
    expect(@teacher.rentals).to include @rental_b
  end

  it 'expects book to be in rental array' do
    expect(@book.rentals.size).to be 2
  end
end
