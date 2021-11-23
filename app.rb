class App


    def display_books
        puts 'List of books:'
        puts 'EMPTY' if @books.empty?
        @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    end

end
