require 'pry'
FIRST_TURN = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

round_winner = ''
total = {user: 0, computer: 0}

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, delimiter1 = ', ', delimiter2 = 'or')
  if array.length > 2
    string1 = array.first((array.length) - 1).join(delimiter1)
    string2 = array.pop.to_s
    return string1 + "#{delimiter1} #{delimiter2} " + string2
  else
    array.join(" #{delimiter2} ")
  end
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARKER }
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  prompt("You are an '#{PLAYER_MARKER}'. Computer is an '#{COMPUTER_MARKER}'")
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def choose_first_turn
  choice = ''
  loop do
    prompt("Who should go first? Enter 'player' or 'computer':  ")
    choice = gets.chomp
    break if choice == 'player' || choice == 'computer'
    prompt("That's not a valid choice, please try again.")
  end
  choice
end



def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}) : ")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that is not a valid choice. Please try again. ")
  end

  brd[square] = PLAYER_MARKER
end

# def computer_places_piece!(brd)
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    if (brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 2) &&
       (brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1)
      square = brd.slice(line[0], line[1], line[2]).key(INITIAL_MARKER)
    elsif (brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2) &&
      (brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1)
      square = brd.slice(line[0], line[1], line[2]).key(INITIAL_MARKER)
    end
  end
  if square == nil && empty_squares(brd).include?(5)
    square = 5
  elsif square == nil
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, crrnt_player)
  if crrnt_player == 'computer'
    computer_places_piece!(brd)
  elsif crrnt_player == 'player'
    player_places_piece!(brd)
  end
end

def alternate_player(crrnt_player)
  case crrnt_player
    when 'player'
      'computer'
    when 'computer'
      'player'
  end
end


def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_total(rnd_winner, total_score)
  case rnd_winner
  when 'Player'
    total_score[:user] += 1
  when 'Computer'
    total_score[:computer] += 1
  end
end

def detect_grandwinner(total_score)
  if total_score.has_value?(5)
    true
  else
    false
  end
end

system 'clear'
prompt("Welcome to tic-tac-toe!")
system 'sleep 2'

loop do
  board = initialize_board
  if FIRST_TURN == 'choose'
    current_player = choose_first_turn
  else
    current_player = FIRST_TURN
  end

  # loop do
  #   display_board(board)
  #   player_places_piece!(board)
  #   break if board_full?(board) || someone_won?(board)
  #   computer_places_piece!(board)
  #   break if board_full?(board) || someone_won?(board)
  # end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    break if board_full?(board) || someone_won?(board)
    current_player = alternate_player(current_player)
  end

  display_board(board)

  if someone_won?(board)
    round_winner = detect_winner(board)
    update_total(round_winner, total)
    prompt("#{round_winner} won the game!")
  else
    prompt("It's a tie!")
  end

  if total[:user] == 5
    prompt "You have won 5 games, you are the grand winner!"
  elsif total[:computer] == 5
    prompt "The computer has won 5 games and is the grand winner!"
  end
 
  break if detect_grandwinner(total)

  answer = ''
  loop do
    prompt("Would you like to play again? Enter 'y' or 'n': ")
    answer = gets.chomp.downcase
    break if answer == 'n' || answer == 'y'
    prompt("That is not a valid answer, please try again.")
  end

  break if answer == 'n'
end

prompt "Thank you for playing, bye!"

