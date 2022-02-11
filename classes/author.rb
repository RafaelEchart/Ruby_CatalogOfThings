class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..500)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
