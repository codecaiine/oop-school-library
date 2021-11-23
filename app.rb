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

    def create_person(decision, age, name)
        case decision
        when 1
          create_student_input(age, name)
        else
          create_teacher_input(age, name)
        end
        puts
    end

    def create_book(title, author)
        @books << Book.new(title, author)
        puts
        puts 'Book created successfully'
        puts
    end
    

end
