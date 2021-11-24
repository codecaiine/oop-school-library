require 'json'
require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'rental'

class Storage
  def stringify_data(person, book, rental)
    File.open('books.json', 'w') {|f| f.write JSON.generate(book)}
    File.open('persons.json', 'w') {|f| f.write JSON.generate(person)}
    File.open('rentals.json', 'w') {|f| f.write JSON.generate(rental)}
  end

  def parse

    book= parse_book,
    person= parse_person
    # rental: parse_rental(parse_book, parse_person)
  {
    'books' => book,
    'persons' => person
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
      if person['json_class'].eql? ('Teacher')
        parse_teacher(person)
      # else
        # parse_student(person)
      end
    end
  else
    []
  end
end

def parse_teacher(person)
 teacher =  Teacher.new(age: person['age'],
        name: person['name'],
        specialization: person['specialization'])
  teacher.id = person['id']
  teacher
end
end