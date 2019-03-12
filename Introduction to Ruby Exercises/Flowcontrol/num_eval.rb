def evaluate_num(number)
  answer = case number
  when 0..50
    "The number is in the range of 0 to 50."
  when 51..100
    "The number is in the range of 51 to 100."
  else
    "That is not a valid entry."
  end
  puts answer
end

print "Enter a number between 0 and 100, please: "
num = gets.to_i

evaluate_num(num)