# 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash


# 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum


# 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.reject! {|key, value| value < 100 }


# 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sort.shift


# 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  if name.start_with?('Be')
    puts "#{name} has index number #{index}"
    break
  end
end


# 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end

p flintstones


# 7

statement = "The Flintstones Rock"

frequencies = {}

statement.chars.each do |char| 
  if frequencies.include?(char)
    frequencies[char] += 1
  else
    frequencies[char] = 1
  end
end

p frequencies


# 9

words = "the flintstones rock"

def titlize(string)
  modif_string = string.split(" ")
  modif_string.map! { |word| word.capitalize!}
  modif_string.join(' ')
end

p titlize(words)


# 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |key, value|
  if value["age"] < 18
    value["age_group"] = "kid"
  elsif value["age"] < 65
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end

p munsters