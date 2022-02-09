require_relative './item'

class Book < Item
  def initialize(publisher, cover_state, publish_date, genre, author, label)
    super(publish_date, genre: genre, author: author, label: label)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
