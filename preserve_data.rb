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
end