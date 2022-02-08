require_relative './item'

class MusicAlbum < Item
  def initialize(genre, publish_date, on_spotify: false)
    @on_spotify = on_spotify
    super(publish_date, genre: genre)
  end

  private

  def can_be_archived?
    @publish_date > 10 && @on_spotify
  end
end

p MusicAlbum.new('R&B', '3/2/3', on_spotify: true)