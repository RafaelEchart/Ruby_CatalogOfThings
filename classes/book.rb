require_relative './item'

class Book < Item
  attr_reader :name, :publisher, :cover_state, :publish_date, :genre, :author, :label

  # rubocop:disable Metrics/ParameterLists
  def initialize(name, publisher, cover_state, publish_date, genre, author, label)
    super(publish_date, genre: genre, author: author, label: label)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
