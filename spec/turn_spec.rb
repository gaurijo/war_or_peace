require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do 
  before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:heart, 'King', 13)
    @card3 = Card.new(:club, 'Two', 2)
    @card4 = Card.new(:heart, 'King', 13)
    @card5 = Card.new(:spade, 'Ten', 10)
    @card6 = Card.new(:diamond, 'Five', 5)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

    @cards2 = [@card4, @card5, @card6]

    @deck2 = Deck.new(@cards2)

    @player1 = Player.new('Megan', @deck)
    @player2 = Player.new('Aurora', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  it "exists and has attributes" do 
    expect(@turn).to be_an_instance_of(Turn)
    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
    expect(@turn.spoils_of_war).to eq([])
  end

  it "has turn types" do 
    expect(@turn.type).to eq(:basic)
  end

  it "has a winner based on turn type" do 
    @player1.deck.rank_of_card_at(0) == 12
    @player2.deck.rank_of_card_at(0) == 13

    expect(@turn.winner).to eq(@player2)
  end

  it "sends cards to the spoils of war" do 
    @turn.pile_cards 

    expect(@turn.spoils_of_war).to eq([@player1.deck.cards[0], @player2.deck.cards[0]])
  end

  it "can add spoil cards to winner's deck" do 
    @player1.deck.rank_of_card_at(0) == 12
    @player2.deck.rank_of_card_at(0) == 13
    expect(@turn.winner).to eq(@player2)

    @turn.award_spoils(@player2)

    expect(@player2.deck.cards).to eq([@spoils_of_war, @player2.deck.cards])
  end
end