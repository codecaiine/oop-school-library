require './book'
class ModuleBooks
  def initialize(arg)
    @books = arg
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title: title, author: author))
    puts 'Book added'
  end

  def display_books
    puts 'All books are: '
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
  end
end
