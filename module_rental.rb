require 'pry'
require_relative 'rental'
require_relative 'module_book'
require_relative 'module_person'

class ModuleRentals
  attr_accessor :rentals

  def initialize(params)
    @rentals = params[:rentals]
    @books = params[:books]
    @persons = params[:persons]
  end

  def add_rental
    puts 'Select a book here: '

    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    select_book = gets.chomp.to_i
    book = @books[select_book]

    puts 'Select a person here: '
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name.split('::').last}],
        Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    select_person = gets.chomp.to_i
    person = @persons[select_person]

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, person, book))
    puts 'Rental has been created successfully'
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
