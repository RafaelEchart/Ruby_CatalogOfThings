module AlbumInputs
  def albums_input
    print 'Please enter the album name: '
    name = gets.chomp
    print '¿Is this album on spotify? [y/n]'
    on_spotify = gets.chomp
    on_spotify = on_spotify == 'y'
    [name, on_spotify]
  end
end
