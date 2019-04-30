# question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")
p ages.include?("Spot")
p ages.key("Spot")
p ages.key?("Spot")
p ages.member?("Spot")


# question 2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase


# question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)


# question 4

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match?('Dino')


# question 5

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# question 6

p flintstones << "Dino"


# question 7

flintstones.delete("Dino")
p flintstones.concat(%w(Dino Hoppy))


# question 8

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!('Few things in life are as important as ')
# or, more concise:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index('house'))
p advice

# question 9

statement = "The Flintstones Rock!"

puts("The amount of lowercase t's is: #{statement.count('t')}.")


# question 10

# my solution:
title = "Flintstone Family Members"

spacing = " " * ((40 - (title.length))/2)
title.prepend(spacing)
title.concat(spacing)

p title

# better solution:
title.center(40)
