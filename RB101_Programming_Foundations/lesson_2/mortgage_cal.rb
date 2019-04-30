def prompt(message)
  Kernel.puts("=> #{message}")
end

loan_amount = ""
annual_rate = ""
duration = ""

prompt("Welcome to the mortgage calculator.")

# get loan amount.
loop do
  prompt("What is the loan amount?")
  prompt("For example, if it's 100.000 dollar, type 100000.")
  loan_amount = gets.chomp
  break if loan_amount.to_i.to_s == loan_amount
  prompt("That is not a valid input, please try again.")
end

loan_amount = loan_amount.to_i

# get annual percentage rate.
loop do
  prompt("What is the Annual Percentage Rate?")
  prompt("Example: Type '5' if the APR is 5%")
  annual_rate = gets.chomp
  break if annual_rate.to_i.to_s == annual_rate
  prompt("That is not a valid input, please try again.")
end

monthly_int_rate = (annual_rate.to_f / 100) / 12

# get duration in months.
loop do
  prompt("What's the duration in months?")
  duration = gets.chomp
  break if duration.to_i.to_s == duration
  prompt("That's not a valid input, please try again.")
end

duration = duration.to_i

monthly_payment = loan_amount * (monthly_int_rate /
                  (1 - (1 + monthly_int_rate)**-duration))

puts "The monthly payment will be #{monthly_payment}."
