class BookRepository

    def all
        sql = 'SELECT * FROM books;'
        result = DatabaseConnection.exec_params(sql, [])
        @booklist = []
        result.each do |book|
            booksample = Book.new
            booksample.id = book["id"]
            booksample.title = book["title"]
            booksample.author_name = book["author_name"]
            @booklist << booksample
        end
        return @booklist
    end

    def print_title
        sql = 'SELECT title FROM books;'
        result = DatabaseConnection.exec_params(sql, [])
        @booktitles = []
        count = 0
        result.each do |book|
            count += 1
            @booktitles << book["title"]
            puts "Book 0#{count}: #{book["title"]}"
        end
        return @booktitles
    end

end

# # Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# # Print out each record from the result set .
# result.each do |book|
#   p record
# end