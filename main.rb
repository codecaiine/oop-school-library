require 'module_rental'
require 'module_person'
require 'module_book'
# rubocop:disable Metrics

class Menu
  attr_accessor :persons, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
    @rental = ModuleRentals.new({ rentals: @rentals, persons: @persons, books: @books })
    @person = ModulePerson.new(@persons)
    @book = ModuleBooks.new(@books)
  end

  def display_option
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp

    get_option option
  end

  def get_option
  display_option
  input = gets.chomp.to_i

    case input
    when 1
      @book.display_books
      get_option
    when 2
      @person.display_person
      get_option
    when 3
      puts 'Create a Person'
      @person.mobule_person
      get_option
    when 4
      puts 'Create a book'
      @book.add_book
      get_option
    when 5
      @rental.add_rental
      get_option
    when 6
      @rental.display_rental
      get_option
    else
      puts 'Thanks for using this app!'
    end
  end

  

def main
    puts 'Welcome to School Library App!'
  
    puts
    test = Menu.new
    test.menu
  end
# rubocop:enable Metrics
puts(main)