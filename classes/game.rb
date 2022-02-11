require_relative './item'

class Game < Item
  attr_reader :name, :publish_date, :genre, :author, :label, :last_played_at, :multiplayer

  # rubocop:disable Metrics/ParameterLists
  def initialize(name, publish_date, genre, author, label, last_played_at, multiplayer)
    @name = name
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    super(publish_date, genre: genre, author: author, label: label)
  end
  # rubocop:enable Metrics/ParameterLists

  def archived?
    can_be_archived?
  end

  private

  def can_be_achived?()
    date = DateTime.now.year
    return true if super && date - @last_played_at > 2

    false
  end
end
