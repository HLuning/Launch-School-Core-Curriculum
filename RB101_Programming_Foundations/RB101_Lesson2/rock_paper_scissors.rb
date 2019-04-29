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

def round_winner(player1_choice, player2_choice)
  if win?(player1_choice, player2_choice)
    :you
  elsif win?(player2_choice, player1_choice)
    :computer
  end
end

def display_round_winner(player1_choice, player2_choice)
  case round_winner(player1_choice, player2_choice)
  when :you
    prompt("You are the winner of this round!")
  when :computer
    prompt("The computer won this round!")
  else
    prompt("It's a tie!")
  end
end

def increment_total(total_hash, player1_choice, player2_choice)
  case round_winner(player1_choice, player2_choice)
  when :you
    total_hash[:you][0] += 1
  when :computer
    total_hash[:computer][0] += 1
  end
end

def display_total(total_hash)
  prompt("You have a total score of #{total_hash[:you][0]}.")
  prompt("The computer has a total score of #{total_hash[:computer][0]}.")
end

def grandwinner?(total_hash)
  if total_hash[:you][0] == WIN_SET
    :you
  elsif total_hash[:computer][0] == WIN_SET
    :computer
  end
end

def display_grandwinner(total_hash)
  if grandwinner?(total_hash) == :you
    prompt("You are the grand winner!")
  elsif grandwinner?(total_hash) == :computer
    prompt("The computer is the grand winner!")
  end
end

choice = ""

total_wins = {
  you:      [0],
  computer: [0]
}

welcome_msg = <<-MSG
"Welcome to rock-paper-scissors-lizard-spock! It's you against the computer.
The first to win #{WIN_SET} rounds will be the grand winner."
MSG
prompt(welcome_msg)

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}, ")
    prompt("To indicate your choice, you can also type r / p / sc / l / sp . ")
    choice = convert_input(Kernel.gets().chomp())

    break if VALID_CHOICES.include?(choice.downcase())

    prompt("That's not a valid choice, please try again.")
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose #{choice}, computer chose #{computer_choice}")

  display_round_winner(choice, computer_choice)

  increment_total(total_wins, choice, computer_choice)

  display_total(total_wins)

  display_grandwinner(total_wins)

  break if grandwinner?(total_wins)

  prompt("Would you like to play again? y/n ")
  play_again = Kernel.gets().chomp()

  break if play_again.downcase.start_with?('n')

  system('clear')
end

prompt("Thank you for playing, bye!")
