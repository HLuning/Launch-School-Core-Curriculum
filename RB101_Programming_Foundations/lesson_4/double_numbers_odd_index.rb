def double_numbers_odd_index(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    if counter.odd?
      doubled_numbers << (numbers[counter] * 2)
    end

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

puts "The original array: #{my_numbers}"
puts "All numbers with odd indices doubled: #{double_numbers_odd_index(my_numbers)}"