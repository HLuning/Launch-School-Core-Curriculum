require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

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

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board

  system 'clear'
  prompt("Welcome to tic-tac-toe!")
  system 'sleep 2'

  loop do
    display_board(board)
    player_places_piece!(board)
    break if board_full?(board) || someone_won?(board)
    computer_places_piece!(board)
    break if board_full?(board) || someone_won?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won the game!")
  else
    prompt("It's a tie!")
  end

  answer = ''
  loop do
    prompt("Would you like to play again? Enter 'y' or 'n': ")
    answer = gets.chomp.downcase
    break if answer == 'n' || answer == 'y'
    prompt("That is not a valid answer, please try again.")
  end

  break if answer == 'n'
end
