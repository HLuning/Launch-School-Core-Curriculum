# def sum_consec(number)
def sum_consec(number)
  (1..number).inject(:+)
end

# def product_consec(number)
def product_consec(number)
  (1..number).inject(:*)
end

# ask for integer greater than 0
puts "Please enter an integer greater than 0: "
input_num = gets.to_i

# ask sum or product
puts "Enter 's' to compute the sum of all numbers between 1 and the entered number. "
puts "Enter 'p' to compute the product of all numbers between 1 and the entered number."
operation = gets.chomp.downcase

case operation
when 's'
  puts "The sum of the integers between 0 and #{input_num} is #{sum_consec(input_num)}."
when 'p'
  puts "The product of the integers between 0 and #{input_num} is #{product_consec(input_num)}."
end