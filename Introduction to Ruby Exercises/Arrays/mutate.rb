def mutate(arr)
  arr.pop
end

def not_mutate(arr)
  arr.select { |i| i > 3 }
end

a = [1, 2, 3, 4, 5, 6]
puts "variable a before the function calls: #{a}"

mutate(a)
not_mutate(a)

puts "variable a after the function calls: #{a}"