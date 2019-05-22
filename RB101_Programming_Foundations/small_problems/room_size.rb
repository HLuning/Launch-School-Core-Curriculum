M2_TO_FT2 = 10.7639

def calculate_m2(length, width)
  length * width
end

def convert_to_ft2(m2)
  (m2 * M2_TO_FT2).round(2)
end

# ask user for length
puts "Please enter the length of the room in meters:  "
input_length = gets.chomp.to_f

# ask user for width 
puts "Please enter the width of the room in meters:  "
input_width = gets.chomp.to_f

square_meters = calculate_m2(input_length, input_width)
square_feet = convert_to_ft2(square_meters)

puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."

