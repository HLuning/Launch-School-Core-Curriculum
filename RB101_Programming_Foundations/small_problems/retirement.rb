# age
puts "What's your age? "
age = gets.to_i

# age of retirement
puts "At what age would you like to retire? "
age_retirement = gets.to_i

# current year
current_year = Time.now.year

# working years left
years_left = age_retirement - age

# year of retirement
year_retirement = current_year + years_left

puts "It's #{current_year}. You will retire in #{year_retirement}."
puts "You only have #{years_left} years of work to go!"