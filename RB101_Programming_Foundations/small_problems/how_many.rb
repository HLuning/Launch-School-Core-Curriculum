# make empty hash 'occurences'
# iterate over the array, filling the hash
# iterate over the hash 'occurrences', print out item and value

def count_occurrences(arrayofwords)
  occurrences = Hash.new(0)
  arrayofwords.each { |item| occurrences[item] += 1 }
  occurrences.each { |word, count| puts "#{word} => #{count}"}
end  

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
