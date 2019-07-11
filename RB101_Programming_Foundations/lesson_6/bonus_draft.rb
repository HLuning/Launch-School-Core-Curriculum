
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
                

def joinor(array, delimiter1 = ', ', delimiter2 = 'or')
  if array.length > 2
    string1 = array.first((array.length) - 1).join(delimiter1)
    string2 = array.pop.to_s
    return string1 + "#{delimiter1} #{delimiter2} " + string2
  else
    array.join(" #{delimiter2} ")
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"


# make computer play defensive

def computer_places_piece!(brd)
  square = ''
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2
      square = brd.slice(*line).key(INITIAL_MARKER)
    else
      square = empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end
