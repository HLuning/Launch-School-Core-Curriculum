produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
} 

puts produce

def select_fruit(production)
  fruits = {}
  keys = production.keys
  counter = 0
  loop do 
    current_key = keys[counter]
    if production[current_key] == 'Fruit'
      fruits[current_key] = production[current_key]
    end
    counter += 1
    break if counter == keys.size
  end
  fruits
end

puts select_fruit(produce)