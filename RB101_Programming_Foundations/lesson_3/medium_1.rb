# question 1

string = "The flintstones rock!"

10.times { puts string.prepend(' ') }


# question 2

# puts "the value of 40 + 2 is " + (40 + 2)
# gives an error because you can't concatenate a string and an integer.


# question 3

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << (number / divisor) if ((number % divisor) == 0)
    divisor -= 1
  end
  factors
end

p factors(10)
p factors(0)
# the purpose of the 'number % divisor == 0' is to check whether the number can be divised by the divisor without remainder.
# the purpose of line 23 is to have the method return the 'factors' array.


# question 4

# Yes there is a difference. The first function modifies the array it starts with, 
# and the original array 'grows' every time an element is added.
# The second method starts with the original array every time. So the result is always
# just the original array plus the one new element that just got added.


# question 5
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"


# question 6

# my solution:
def append_rutabaga!(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
append_rutabaga!(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# LS solution:
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# question 7

# 34


# question 8

# Yes, because indexed assignment is mutating, 
# the block that performs indexed assigment on the hash mustated the caller (munsters).


# question 9

puts "paper"


# question 10

# 'no'
