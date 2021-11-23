class App


    def display_books
        puts 'List of books:'
        puts 'EMPTY' if @books.empty?
        @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end

    def display_people
        puts 'List of people:'
        puts 'EMPTY' if @people.empty?
        @people.each_with_index do |person, index|
          puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
        end
    end

end
