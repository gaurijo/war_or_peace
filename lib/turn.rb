class Turn 
  attr_reader :player1, :player2, :spoils_of_war, :type
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :basic
  end

  def winner 
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def pile_cards 
    @spoils_of_war << @player1.deck.cards[0] << @player2.deck.cards[0]
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war 
  end
end