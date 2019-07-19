def initialize_deck
  suits = ['hearts', 'spades', 'diamonds', 'clubs']
  ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', ] +
          ['jack', 'queen', 'king', 'ace']
  new_deck = []
  suits.each do |suit|
    ranks.each do |rank|
      new_deck << [suit, rank]
    end
  end

  new_deck
end

my_deck = initialize_deck

p my_deck
