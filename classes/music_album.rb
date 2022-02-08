require_relative './item'

class MusicAlbum < Item
  def initialize(genre, publish_date, on_spotify: false)
    @on_spotify = on_spotify
    @genre = genre
    @publish_date = publish_date
    super(publish_date, genre: @genre)
  end

  private

  def can_be_archived?
    @publish_date > 10
  end
end
