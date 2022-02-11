# rubocop:disable Style/ClassVars
module AlbumsMemory
  @@albums = []

  def add_albums(new_album)
    @@albums << new_album
  end

  def show_albums
    @@albums
  end
end
# rubocop:enable Style/ClassVars
