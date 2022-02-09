class Genre
  attr_reader :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
