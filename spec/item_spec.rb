require_relative '../classes/item'
require 'date'

describe 'test Item class' do
  before(:each) do
    @item = Item.new(2000)
  end
  it 'instantiates an Item' do
    expect(@item).to be_instance_of Item
  end
  it 'should be archivable' do
    expect(@item.archived?).to be(true)
  end
end
