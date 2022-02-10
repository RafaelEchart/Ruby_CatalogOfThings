require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  before(:each) do
    @genre = Genre.new('Pop')
    @album = MusicAlbum.new('The Mockingbird', '12/12/2022', @genre, 'author', 'label', on_spotify: true)
  end
  context 'When testing Genre class' do
    it 'creates a new instance' do
      expect(@genre.name).to eql 'Pop'
    end

    it 'adds a new item to the items array' do
      @genre.add_item(@album)
      expect(@genre.items.length).to eql 1
    end
  end
end
