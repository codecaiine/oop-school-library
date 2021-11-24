require 'json'
require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'rental'

class Storage
  def stringify_data(person, book, rental)
    File.open('books.json', 'w') { |f| f.write JSON.generate(book) }
    File.open('persons.json', 'w') { |f| f.write JSON.generate(person) }
    File.open('rentals.json', 'w') { |f| f.write JSON.generate(rental) }
  end

  def parse
    {
      books: parse_book,
      persons: parse_person,
      rentals: parse_rental(parse_person, parse_book)
    }
  end

  def parse_book
    file = 'books.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |book|
        Book.new(title: book['title'], author: book['author'])
      end
    else
      []
    end
  end

  def parse_person
    file = 'persons.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |person|
        if person['json_class'].eql?('Teacher')
          parse_teacher(person)
        else
          parse_student(person)
        end
      end
    else
      []
    end
  end

  def parse_teacher(person)
    teacher = Teacher.new(age: person['age'].to_i,
                          name: person['name'],
                          specialization: person['specialization'])
    teacher.id = person['id']
    teacher
  end

  def parse_student(person)
    student = Student.new(age: person['age'].to_i,
                          name: person['name'],
                          classroom: person['classroom'],
                          parent_permission: person['parent_permission'])
    student.id = person['id']
    student
  end

  def parse_rental(persons, books)
    file = 'rentals.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |rental|
        person = persons.detect { |p| p.id.eql?(rental['person']['id']) }
        book = books.detect { |b| b.title.eql?(rental['book']['title']) }
        Rental.new(rental['date'], person, book)
      end
    else
      []
    end
  end
end
