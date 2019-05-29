array_nums = []

puts "Please enter the 1st number:"
array_nums[0] = gets.to_i

puts "Please enter the 2nd number:"
array_nums[1] = gets.to_i

puts "Please enter the 3rd number:"
array_nums[2] = gets.to_i

puts "Please enter the 4th number:"
array_nums[3] = gets.to_i

puts "Please enter the 5th number:"
array_nums[4] = gets.to_i

puts "Please enter the last number:"
last_num = gets.to_i

if array_nums.include?(last_num)
  puts "The number #{last_num} appears in #{array_nums}."
else
  puts "The number #{last_num} does not appear in #{array_nums}."
end
