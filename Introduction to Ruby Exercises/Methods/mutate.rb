a = [1, 2, 3]

# Example of a method that mutates its caller:
def mutate(array)
  array.pop
end

# Example of method that does not mutates its caller:
def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"