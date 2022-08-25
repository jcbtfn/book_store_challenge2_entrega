require "book_repository"
require "book"

def reset_books_table
    seed_sql = File.read('../databases/resources/seeds/book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
end

describe BookRepository do
    before(:each) do 
        reset_books_table
    end

    it "#Returns the number of books we have in the table, 5" do
        library = BookRepository.new
        expect(library.all.length).to eq 5
    end

    it "#Returns the information of book 1 - Nineteen Eighty-Four George Orwell" do
        library = BookRepository.new
        expect(library.all[0].id).to eq "1"
        expect(library.all[0].title).to eq "Nineteen Eighty-Four"
        expect(library.all[0].author_name).to eq "George Orwell"
    end

    it "#Returns the information of book 2 - Mrs Dalloway Virginia Woolf" do
        library = BookRepository.new
        expect(library.all[1].id).to eq "2"
        expect(library.all[1].title).to eq "Mrs Dalloway"
        expect(library.all[1].author_name).to eq "Virginia Woolf"
    end

    it "#Returns an array of all the title [Nineteen Eighty-Four, Mrs Dalloway, Emma, Dracula, The Age of Innocence]" do
        library = BookRepository.new
        expect(library.print_title).to eq ["Nineteen Eighty-Four", "Mrs Dalloway", "Emma", "Dracula", "The Age of Innocence"]
    end

end