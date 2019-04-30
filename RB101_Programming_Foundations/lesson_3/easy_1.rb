# question 1

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # I'd expect 1 2 2 3 (each number on a new line)


# question 2

# When you see '!' or '?' at the end of a method name, 
# it's part of the method name but not part of the ruby syntax.
# '!' at the end of a method name indicates that the method may mutate it's caller,
# but this by convention and not part of the Ruby syntax.
# '?' at the end of a method name indicates that the method may return a boolean value,
# but this by convention and not part of the Ruby syntax.

# '!=' reads as 'is not' (part of the syntax)
# '!' before something inverses it's boolean value (part of the syntax)
# '!' after a method call like words.uniq! suggests the method mutates the caller (by convention, not part of the syntax)
# '?' before something could be the ternary operator.
# '?' after something suggests it returns a boolean value.
# '!!'before something returns the boolean valu of the something.


# question 3

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent")

p advice


# question 4

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
p numbers


# question 5

puts("Does 42 lie between 10 and 100? #{(1..100).cover?(42)}.")


# question 6

famous_words = "seven years ago..."
p famous_words.prepend("Four score and ")

famous_words = "seven years ago..."
p famous_words = "Four score and " + famous_words


# question 7

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)


# question 8

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!


# question 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")