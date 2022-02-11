require_relative '../classes/book'
require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new('Gryffindor', 'red')
    @book = Book.new('Harry Potter', 'Hogwarts', 'bad', 10, @genre, 'JK Tolkien', 'Yellow')
  end

  context 'When testing Label class' do
    it 'it should return the correct title' do
      expect(@label.title).to eql 'Gryffindor'
    end

    it 'it should return the correct color' do
      expect(@label.color).to eql 'red'
    end

    it 'adds a new item to the items array' do
      @label.add_item(@book)
      expect(@label.items.length).to eql 1
    end
  end
end
