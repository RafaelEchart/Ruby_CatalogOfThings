require_relative '../classes/book'
require_relative '../classes/genre'

describe Book do
  before(:each) do
    @genre = Genre.new('Magic')
    @book = Book.new('Harry Potter', 'Hogwarts', 'bad', 10, @genre, 'JK Tolkien', 'Yellow')
  end

  context 'When testing Book class' do
    it 'should have a genre name' do
      expect(@book.genre.name).to eql 'Magic'
    end

    it 'is_archived? should return false because the cover is "bad"' do
      expect(@book.archived?).to be true
    end
  end
end
