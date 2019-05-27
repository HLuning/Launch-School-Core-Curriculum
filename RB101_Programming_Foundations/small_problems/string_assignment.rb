name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This prints out two times 'BOB' on separate lines.
# the upcase! method modifies the string object that both name and save_name are pointing at.