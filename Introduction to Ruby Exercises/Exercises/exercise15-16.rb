#exercise 15
=begin

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

puts "arr before delete_if method: #{arr}"

arr.delete_if { |word| word.start_with?("s", "w")}

puts "arr after delete_if method: #{arr}"
=end

#exercise 16

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! { |string| string.split(" ")}
a.flatten!

p a