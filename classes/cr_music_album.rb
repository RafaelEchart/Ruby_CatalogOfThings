require_relative './music_album'

class CRMusicAlbum
  def initialize
    @music_albums = []
  end

  def add_album(genre, publish_date, on_spotify)
    @music_albums << MusicAlbum.new(genre, publish_date, on_spotify: on_spotify)
    p @music_albums[0]
  end
end
