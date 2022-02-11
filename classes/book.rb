require_relative './item'

class Book < Item
  attr_reader :name, :publisher, :cover_state, :publish_date, :genre, :author, :label

  def initialize(name, publisher, cover_state, publish_date, genre, author, label)
    super(publish_date, genre: genre, author: author, label: label)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end

  def archived?
    can_be_archived?
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
