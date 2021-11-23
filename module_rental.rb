require 'pry'
require 'rental'
require 'module_book'
require 'module_person'

class ModuleRentals
  attr_accessor :rentals

  def initialize(params)
    @rentals = params[:rentals]
    @books = params[:books]
    @persons = params[:persons]
  end

  def create_rental
    puts 'Select a book from the following list: '

    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    select_book = gets.chomp.to_i
    book = @books[select_book]

    puts 'Select a person from the following list: '
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name.split('::').last}],
        Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    select_person = gets.chomp.to_i
    person = @persons[select_person]

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date: date, person: person, book: book))
    puts 'Rental created successfully'
  end

  def display_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    selected_rentals = @rentals.select { |rental| rental.person.id == id }
    selected_rentals.each do |s_rental|
      puts "Date: #{s_rental.date}, Book: #{s_rental.book.title} by #{s_rental.book.author}"
    end
  end
end
