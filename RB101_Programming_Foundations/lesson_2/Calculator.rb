# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'


def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def access_msghsh(messagekey, language = 'nl')
  MESSAGES[language][messagekey]
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

prompt(access_msghsh('welcome'))

name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    puts(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(access_msghsh('ask_number1'))
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    prompt(access_msghsh('invalid_num'))
  end

  number2 = ''
  loop do
    prompt(access_msghsh('ask_number2'))
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    prompt(access_msghsh('invalid_num'))
  end

  prompt(access_msghsh('operator_prompt'))

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt(access_msghsh('invalid_operator'))
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
