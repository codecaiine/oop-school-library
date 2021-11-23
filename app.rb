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

    def create_rental(book_index, person_index, date)
        Rental.new(date, @books[book_index], @people[person_index])
        puts 'Rental created successfully'
        puts
    end

    def display_rentals(person_input)
        renter = @people.select { |person| person.id == (person_input) }
        if renter.empty?
          puts 'No rentals found for this ID'
          user_rental_id_input
        else
          puts renter
          puts "Rentals of #{renter.first.name}:"
          puts 'EMPTY' if renter.first.rentals.empty?
          puts(renter.first.rentals.map { |rental| "Book: #{rental.book.title}, Rented on: #{rental.date}" })
          enter_msg
        end
    end
    

end
