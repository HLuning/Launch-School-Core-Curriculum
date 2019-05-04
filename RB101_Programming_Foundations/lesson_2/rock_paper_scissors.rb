VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_COMBOS = {
  rock:     [:lizard, :scissors],
  paper:    [:rock, :spock],
  scissors: [:paper, :lizard],
  lizard:   [:spock, :paper],
  spock:    [:scissors, :rock]
}

WIN_SET = 5

def prompt(message)
  Kernel.puts("=> #{message}")
end

def convert_input(user_input)
  case user_input.downcase
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  else
    user_input
  end
end

def win?(player1_choice, player2_choice)
  WINNING_COMBOS[player1_choice.to_sym].include?(player2_choice.to_sym)
end

def find_winner(player1_choice, player2_choice)
  if win?(player1_choice, player2_choice)
    :you
  elsif win?(player2_choice, player1_choice)
    :computer
  end
end

def display_winner(winner)
  case winner
  when :you
    prompt("You are the winner of this round!")
  when :computer
    prompt("The computer won this round!")
  else
    prompt("It's a tie!")
  end
end

def increment_total(total_hash, winner)
  case winner
  when :you
    total_hash[:you] += 1
  when :computer
    total_hash[:computer] += 1
  end
end

def display_total(total_hash)
  prompt("You have a total score of #{total_hash[:you]}.")
  prompt("The computer has a total score of #{total_hash[:computer]}.")
end

def find_grandwinner(total_hash)
  if total_hash[:you] == WIN_SET
    :you
  elsif total_hash[:computer] == WIN_SET
    :computer
  end
end

def display_grandwinner(grandwinner)
  if grandwinner == :you
    prompt("You are the grand winner!")
  elsif grandwinner == :computer
    prompt("The computer is the grand winner!")
  end
end

choice = ""

total_wins = {
  you:      0,
  computer: 0
}

system('clear')

welcome_msg = <<-MSG
"Welcome to rock-paper-scissors-lizard-spock! It's you against the computer.
The first to win #{WIN_SET} rounds will be the grand winner."
MSG
prompt(welcome_msg)

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}. ")
    prompt("To indicate your choice, you can also type r / p / sc / l / sp . ")
    choice = convert_input(Kernel.gets().chomp())

    break if VALID_CHOICES.include?(choice.downcase())

    prompt("That's not a valid choice, please try again.")
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose #{choice}, computer chose #{computer_choice}")

  round_winner = find_winner(choice, computer_choice)

  display_winner(round_winner)

  increment_total(total_wins, round_winner)

  display_total(total_wins)

  grandwinner = find_grandwinner(total_wins)

  display_grandwinner(grandwinner)

  break if grandwinner

  play_again = ''

  loop do
    yes_or_no = %w(yes no n y)
    prompt("Would you like to play again? y/n ")
    play_again = Kernel.gets().chomp()

    if yes_or_no.include?(play_again.downcase)
      break
    else
      prompt("That is not a valid choice. Please try again.")
    end
  end

  break unless play_again.downcase.start_with?('y')

  system('clear')
end

prompt("Thank you for playing, bye!")
