def prompt(message)
  puts "=> #{message}"
end

def join_and(array, delimiter1 = ', ', delimiter2 = 'and')
  if array.length > 2
    string1 = array.first(array.length - 1).join(delimiter1)
    string2 = array.pop.to_s
    string1 + "#{delimiter1}#{delimiter2} " + string2
  else
    array.join(" #{delimiter2} ")
  end
end

def initialize_deck
  suits = ['hearts', 'spades', 'diamonds', 'clubs']
  ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10'] +
          ['jack', 'queen', 'king', 'ace']
  new_deck = []
  suits.each do |suit|
    ranks.each do |rank|
      new_deck << [suit, rank]
    end
  end

  new_deck
end

def deal_cards(deck, hand)
  hand << deck.delete_at(rand(deck.length - 1))
end

def calculate_value(hand)
  sum = 0
  hand.each do |card|
    if card[1] == 'ace'
      sum += 11
    elsif card[1].to_i == 0
      sum += 10
    else
      sum += card[1].to_i
    end

    if sum > 21
      hand.each do |crd|
        if sum > 21 && crd[1] == 'ace'
          sum -= 10
        end
      end
    end
  end
  sum
end

def display_dlrhand(dlr_hand)
  prompt("Dealer has: #{dlr_hand[0][1]} and a hidden card.")
end

def display_plrhand(plr_hand)
  just_ranks = plr_hand.map do |card|
    card[1]
  end

  prompt("You have #{join_and(just_ranks)}.")
end

def display_totals(plr_hand, dlr_hand)
  prompt("You have a total of #{calculate_value(plr_hand)}.")
  prompt("Dealer has a total of #{calculate_value(dlr_hand)}.")
end

def busted?(hand)
  hand_value = calculate_value(hand)
  hand_value > 21
end

def twenty_one?(hand)
  hand_value = calculate_value(hand)
  hand_value == 21
end

def find_winner(plr_hand, dlr_hand)
  total_player = calculate_value(plr_hand)
  total_dealer = calculate_value(dlr_hand)

  if total_player == total_dealer
    :tie
  elsif total_player > total_dealer
    :player
  else
    :dealer
  end
end

def display_winner(plr_hand, dlr_hand)
  winner = find_winner(plr_hand, dlr_hand)

  case winner
  when :tie
    prompt("It's a tie!")
  when :player
    prompt("You won the game!")
  when :dealer
    prompt("The dealer won the game!")
  end
end

loop do
  # initialize deck
  main_deck = initialize_deck
  player_hand = []
  dealer_hand = []

  # deal cards to player (2 cards) and to dealer (2 cards)
  2.times { deal_cards(main_deck, player_hand) }
  2.times { deal_cards(main_deck, dealer_hand) }

  # 'Welcome to game' prompt
  system 'clear'
  prompt("Welcome to 21!")
  system 'sleep 2'

  # loop to deal cards to player until busted or 'stay'
  loop do
    display_dlrhand(dealer_hand)
    display_plrhand(player_hand)

    break if busted?(player_hand)
    break if twenty_one?(player_hand)

    answer = ''
    loop do
      prompt("Would you like to hit or stay? (Enter 'hit' or 'stay')")
      answer = gets.chomp
      break if answer == 'stay' || answer == 'hit'
      prompt("That's not a valid answer, please try again.")
    end

    break if answer == 'stay'

    deal_cards(main_deck, player_hand)
  end

  if busted?(player_hand)
    prompt("You are busted, dealer won the game!")
    system 'sleep 2'
  elsif twenty_one?(player_hand) && !twenty_one?(dealer_hand)
    prompt("You are the first to have reached 21, you won the game!")
    system 'sleep 2'
  else
    # deal cards to dealer until total_dealer >= 17 or 'busted'
    loop do
      display_dlrhand(dealer_hand)
      display_plrhand(player_hand)
      system 'sleep 2'

      total_dealer = calculate_value(dealer_hand)

      break_dealer_loop = nil

      if total_dealer < 17
        prompt("Dealer chooses to hit")
        system 'sleep 2'
        deal_cards(main_deck, dealer_hand)
      elsif total_dealer == 21
        prompt("Dealer has 21! Dealer won the game.")
        system 'sleep 2'
        break_dealer_loop = true
      elsif total_dealer >= 17
        prompt("Dealer chooses to stay")
        system 'sleep 2'
        prompt("")
        display_totals(player_hand, dealer_hand)
        display_winner(player_hand, dealer_hand)
        break_dealer_loop = true
      end

      # why does it not work when I put the above in a case statement?

      break if break_dealer_loop
    end
  end

  play_again = ''
  loop do
    prompt("Would you like to play again? Enter 'yes' or 'no': ")
    play_again = gets.chomp.downcase
    break if play_again == 'yes' || play_again == 'no'
    prompt("That is not a valid answer, please try again.")
  end

  break if play_again == 'no'
end

prompt("Thank you for playing, bye!")
