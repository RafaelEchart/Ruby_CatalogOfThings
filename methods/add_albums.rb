require_relative '../inputs/general_inputs'
require_relative '../classes/music_album'
require_relative '../inputs/album_inputs'
require_relative '../memory/album_memory'

class AddAlbums
  include AlbumsMemory
  include GeneralInputs
  include AlbumInputs

  def add
    name, on_spotify = albums_input
    author, label, genre, publish_date = general_inputs

    new_album = MusicAlbum.new(name, publish_date, genre, author, label, on_spotify: on_spotify)

    add_albums(new_album)

    label.add_item(new_album)
    genre.add_item(new_album)
    author.add_item(new_album)

    puts 'Album created successfully'
  end
end
