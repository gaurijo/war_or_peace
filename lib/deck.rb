class Deck 
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_value = []
    @cards.each do |card|      
      if card.value == "Queen" || card.value == "King" || card.value == "Ace"
        high_value << card 
      end
    end
    high_value 
  end

  def percent_high_ranking
    x = self.high_ranking_cards.count
    y = @cards.count 
    result = x/y.to_f * 100
    result.round(2)
  end

  def remove_card 
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards << card 
  end
end