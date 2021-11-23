require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './app'

# rubocop:disable Metrics

class Main
  include App

  def initialize
    @input = 0
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('Grade 5')
  end

  def run
    print 'Welcome To School Library App'
    sleep 0.75
    menu
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - add a person'
    puts '4 - add a book'
    puts '5 - add a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp

    get_option option
  end

  def get_option
    case @input
    when 1
      display_books
      start_message
    when 2
      display_people
      start_message
    when 3
      user_person_input
    when 4
      user_book_input
    when 5
      user_rental_input unless @books.empty? && @people.empty?
    when 6
      user_rental_id_input unless @people.empty?
    else
      if @input != 7
        puts 'Please enter a number between 1 and 7'
        puts
      end
    end
  end

  def user_person_input
    decision = 0
    until [1, 2].include?(decision)
      puts 'Do you want to add a student (1), or a teacher (2)?'
      print INPT_MSG
      decision = gets.chomp.to_i
      next if [1, 2].include?(decision)

      puts
      puts 'Invalid input, please try again'
      puts
    end
    print 'Age --> '
    age = gets.chomp.to_i
    print 'Name --> '
    name = gets.chomp
    add_person(decision, age, name)
  end

  def user_book_input
    puts 'Please, enter book information below:'
    print 'Title --> '
    title = gets.chomp
    print 'Author --> '
    author = gets.chomp
    add_book(title, author)
    puts
    puts 'Book added successfully'
    puts
  end

  def user_rental_input
    puts 'Select a book from the following list:'
    display_books
    print INPT_MSG
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person form the following list:'
    display_people
    print INPT_MSG
    person_index = gets.chomp.to_i
    puts
    print 'Enter date of retrieval --> '
    date = gets.chomp
    add_rental(book_index, person_index, date)
    puts 'Rental added successfully'
    puts
  end

  def user_rental_id_input
    loop do
      print 'Enter the person\'s ID --> '
      display_people
      person_input = gets.chomp.to_i
      display_rentals(person_input)
      break if person_input
    end
  end

  def add_student_input(age, name)
    print 'Has parent permission? [Y/N] --> '
    permission = gets.chomp.upcase
    permission = permission != 'N'
    add_student(age, name, permission)
    puts 'Student added successfully'
    puts
  end

  def add_teacher_input(age, name)
    print 'Specialty --> '
    specialty = gets.chomp
    add_teacher(specialty, age, name)
    puts
    puts 'Teacher added successfully'
    puts
  end

  def main
    until @input == 7
      menu
      @input = gets.chomp.to_i
      puts
      get_option
    end
    save_json
    puts 'Exiting session'
    puts 'Good bye!'
  end
end

# rubocop:enable Metrics
Main.new.main
