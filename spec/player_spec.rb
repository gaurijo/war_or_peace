require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do 
  before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:heart, 'King', 13)
    @card3 = Card.new(:club, 'Two', 2)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end
  it "exists and has attributes" do 
    expect(@player).to be_an_instance_of(Player)
    expect(@player.name).to eq('Clarisa')
    expect(@player.deck).to eq(@deck)
    expect(@player.has_lost?).to eq(false)
  end

  it "can remove the top card from the deck" do 
    @player.deck.remove_card

    expect(@player.deck.cards).to eq([@card2, @card3])
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card 

    expect(@player.deck.cards).to eq([@card3])
    expect(@player.has_lost?).to eq(false)
  end

  it "loses the game when all cards are removed" do 
    @player.deck.remove_card 
    @player.deck.remove_card 
    @player.deck.remove_card 

    expect(@player.deck.cards).to eq([])
    expect(@player.has_lost?).to eq(true)

  end
end