# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

prompt("Welcome to the calculator! Please enter your name:  ")

name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    puts "that is not a valid entry. Please try again:  "
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?  ")
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    prompt("That is not a valid input.")
  end

  number2 = ''
  loop do
    prompt("What's the second number?  ")
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    prompt("That is not a valid input.")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform on these numbers?
    1) add
    2) subtract
    3) multiply
    4) divide

  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt "You must choose 1, 2, 3 or 4. Please try again:  "
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}.")
  prompt("Do you want to perform another calculation? Type 'Y' for yes.")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
