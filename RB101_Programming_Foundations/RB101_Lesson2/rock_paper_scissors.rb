VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_CONDITIONS = {
  rock: [:lizard, :scissors],
  paper: [:rock, :spock],
  scissors: [:paper, :lizard],
  spock: [:scissors, :rock],
  lizard: [:paper, :spock]
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def convert_choice(user_input)
  case user_input.downcase
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'sp'
    'spock'
  when 'l'
    'lizard'
  else
    user_input
  end
end

def win?(firstplayer, secondplayer)
  WINNING_CONDITIONS[firstplayer.to_sym].include?(secondplayer.to_sym)
end

def determine_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'none'
  end
end

def display_results(winner)
  case winner
  when 'player'
    prompt("You won!")
  when 'computer'
    prompt("The computer won!")
  when 'none'
    prompt("It's a tie!")
end

def increment_totalwins

welcome_msg = <<-MSG
You're playing rock-paper-scissors-spock-lizard against the computer.
When either you or the computer reaches five wins,
the game is over and the winning player becomes the grand winner.
MSG

prompt(welcome_msg)

loop do
  choice = ""
  loop do
    choice_prompt_msg = <<-MSG
    Choose one: #{VALID_CHOICES.join(', ')},
    or type 'r'/ 'p'/ 'sc'/ 'sp'/ 'l': ")
    MSG

    prompt(choice_prompt_msg)
    choice = convert_choice(Kernel.gets().chomp())

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, computer chose #{computer_choice}")

  winner = determine_winner(choice, computer_choice)

  display_results(winner)

  increment_totalwins(winner)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")

end

prompt("Thank you for playing!")
