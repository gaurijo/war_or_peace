require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do 
  before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:heart, 'King', 13)
    @card3 = Card.new(:club, 'Two', 2)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

  it "exists" do 

    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has cards" do 
    expect(@deck.cards).to eq(@cards)
  end

  it "has rank for cards" do 
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(1)).to eq(13)
    expect(@deck.rank_of_card_at(2)).to eq(2)
  end

  it "has high ranking cards" do 
    expect(@deck.high_ranking_cards).to eq([@card1, @card2])
    expect(@deck.high_ranking_cards).to_not eq([@card3])
  end

  it "can calculate percentage of high ranking cards" do 
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it "can remove the top card" do 
    @deck.remove_card

    expect(@deck.cards).to eq([@card2, @card3])
  end

  it "can add a new card" do 
    @card4 = Card.new(:club, '5', 5)

    @deck.remove_card
    @deck.add_card(@card4)

    expect(@deck.cards).to eq([@card2, @card3, @card4])
    expect(@deck.high_ranking_cards).to eq([@card2])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end