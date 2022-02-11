require_relative '../classes/game'

describe Game do
  before :each do
    @game = Game.new('Hitman Sniper', 10, 'FPS', 'Codepanther', 'guns', '2010-01-30', true)
  end

  it 'should return the correct name' do
    expect(@game.name).to eq 'Hitman Sniper'
  end

  it 'check if the game can be archived' do
    expect(@game.archived?).to be nil
  end
end
