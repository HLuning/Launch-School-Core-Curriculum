array = [1, 2, 5, 8]

new_array = array.map do |item|
  item + 2
end

p array
p new_array