require_relative './item'

class MusicAlbum < Item
  def initialize(name, publish_date, genre, author, label, on_spotify: false)
    @on_spotify = on_spotify
    @name = name
    super(publish_date, genre: genre, author: author, label: label)
  end

  private

  def can_be_archived?
    @publish_date > 10 && @on_spotify
  end
end
