class Item
  def initialize(publish_date, genre: '', author: '', source: '', label: '')
    @id = Random.rand(1..10_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archive = false
  end

  def add_genre(genre)
    @genre = genre
    @genre.item.push(self) unless @genre.include?(genre)
  end
  
  def move_to_archive
    @archive = can_be_archived?
  end

  private

  def can_be_archived?
    true if @publish_date > 10
  end
end
