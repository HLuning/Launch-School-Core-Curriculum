# question 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# The string will not be mutated by the method, because the reference of my_string
# is passed to the method, and the reassignment (+=) will not mutate the actual object
# that my_string refers to.

# The array will be mutated, since the shovel operator is a mutating operator. 

# question 4

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# My_string will be modified after the method call, since '<<' is a destructive operation
# and works on the value that both my_string and a_string_param are pointing at.
# my_array will not be modified after the method call, since '=' indicates reassignment,
# which will create a new object that an_array_param will be pointing at. my_array will
# still be pointing at the value it had before the method call.


# question 5

def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue")
p color_valid("red")