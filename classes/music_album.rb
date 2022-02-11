require_relative './item'

class MusicAlbum < Item
  attr_reader :name, :publish_date, :genre, :author, :label, :on_spotify

  # rubocop:disable Metrics/ParameterLists
  def initialize(name, publish_date, genre, author, label, on_spotify: false)
    @on_spotify = on_spotify
    @name = name
    super(publish_date, genre: genre, author: author, label: label)
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def can_be_archived?
    @publish_date > 10 && @on_spotify
  end
end
