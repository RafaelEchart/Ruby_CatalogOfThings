class Item
  attr_reader :id

  def initialize(publish_date, genre: '', author: '', label: '')
    @id = Random.rand(1..10_000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archive = false
  end

  def add_genre(genre)
    @genre = genre
    @genre.item.push(self) unless @genre.include?(genre)
  end

  def add_author(author)
    @author = author
    @author.item.push(self) unless @author.include?(author)
  end

  def move_to_archive
    @archive = can_be_archived?
  end

  private

  def can_be_archived?
    true if @publish_date > 10
  end
end
