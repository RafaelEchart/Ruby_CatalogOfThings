require_relative '../classes/music_album'

describe 'test a new instance of MusicAlbum' do
  before(:each) do
    @genre = Genre.new('Pop')
    @album = MusicAlbum.new('The Mockingbird', '12'.to_i, @genre, 'author', 'label', on_spotify: true)
  end

  context 'When testing MusicAlbum class' do
    it 'creates a new instance' do
      expect(@album.name).to eql 'The Mockingbird'
    end

    it 'it can be archived?' do
      expect(@album.archived?).to be true
    end
  end
end
