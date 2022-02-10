require_relative './item'

class Game < Item
  attr_reader :name, :publish_date, :genre, :author, :label, :last_played_at, :multiplayer

  def initialize(name, publish_date, genre, author, label, last_played_at, multiplayer)
    @name = name
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    super(publish_date, genre: genre, author: author, label: label)
  end

  private

  def can_be_archived?
    Date.today > Date.iso8601(@last_played_at).next_year(2) || super
  end
end
