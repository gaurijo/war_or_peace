require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

@cards = [
  ad = Card.new(:diamond, 'Ace', 1),
  ah = Card.new(:heart, 'Ace', 1),
  as = Card.new(:spade, 'Ace', 1),
  ac = Card.new(:club, 'Ace', 1),

  d = Card.new(:diamond, 'Two', 2),
  h = Card.new(:heart, 'Two', 2),
  s = Card.new(:spade, 'Two', 2),
  c = Card.new(:club, 'Two', 2),

  dd = Card.new(:diamond, 'Three', 3),
  hh = Card.new(:heart, 'Three', 3),
  ss = Card.new(:spade, 'Three', 3),
  cc = Card.new(:club, 'Three', 3),

  ddd = Card.new(:diamond, 'Four', 4),
  hhh = Card.new(:heart, 'Four', 4),
  sss = Card.new(:spade, 'Four', 4),
  ccc = Card.new(:club, 'Four', 4),

  dddd = Card.new(:diamond, 'Five', 5),
  hhhh = Card.new(:heart, 'Five', 5),
  ssss = Card.new(:spade, 'Five', 5),
  cccc = Card.new(:club, 'Five', 5),

  sd = Card.new(:diamond, 'Six', 6),
  sh = Card.new(:heart, 'Six', 6),
  ss = Card.new(:spade, 'Six', 6),
  sc = Card.new(:club, 'Six', 6),

  sed = Card.new(:diamond, 'Seven', 7),
  seh = Card.new(:heart, 'Seven', 7),
  ses = Card.new(:spade, 'Seven', 7),
  sec = Card.new(:club, 'Seven', 7),

  eid = Card.new(:diamond, 'Eight', 8),
  eih = Card.new(:heart, 'Eight', 8),
  eis = Card.new(:spade, 'Eight', 8),
  eic = Card.new(:club, 'Eight', 8),

  nid = Card.new(:diamond, 'Nine', 9),
  nih = Card.new(:heart, 'Nine', 9),
  nis = Card.new(:spade, 'Nine', 9),
  nic = Card.new(:club, 'Nine', 9),

  td = Card.new(:diamond, 'Ten', 10),
  th = Card.new(:heart, 'Ten', 10),
  ts = Card.new(:spade, 'Ten', 10),
  tc = Card.new(:club, 'Ten', 10),

  jd = Card.new(:diamond, 'Jack', 11),
  jh = Card.new(:heart, 'Jack', 11),
  js = Card.new(:spade, 'Jack', 11),
  jc = Card.new(:club, 'Jack', 11),

  qd = Card.new(:diamond, 'Queen', 12),
  qh = Card.new(:heart, 'Queen', 12),
  qs = Card.new(:spade, 'Queen', 12),
  qc = Card.new(:club, 'Queen', 12),

  kd = Card.new(:diamond, 'King', 13),
  kh = Card.new(:heart, 'King', 13),
  ks = Card.new(:spade, 'King', 13),
  kc = Card.new(:club, 'King', 13)]

  @deck = Deck.new(@cards[0..25])
  @deck2 = Deck.new(@cards[26..52])

  @player1 = Player.new("Megan", @deck)
  @player2 = Player.new("Aurora", @deck2)

  turn = Turn.new(@player1, @player2)

  
  puts "Welcome to War! (or Peace) This game will be played with 52 cards."
  p
  puts "The players today are Megan and Aurora."
  p
  puts "Type 'GO' to start the game!"

  input = gets.chomp.upcase 
  if input == "GO"
    puts "--------------------------------------------------------"
  else 
    loop do 
      puts "Invalid, please type GO to start!"
      input = gets.chomp 
      break if input == 'GO'
    end 
  end

  turn_count = 0

  loop do 
    turn_count += 1
    turn.pile_cards 

    if turn.type == :basic
      puts "#{turn.winner.name} won #{turn.spoils_of_war.count} cards"
      @player1.deck.remove_card 
      @player2.deck.remove_card
    end

    break if @player1.has_lost? || @player2.has_lost? || turn_count > 100
    turn.award_spoils(turn.winner)
    require 'pry'; binding.pry 
  end


  

