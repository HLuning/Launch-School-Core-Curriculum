def average(array)
  length = array.length
  sum = 0
  array.each do |num|
    sum += num
  end

  sum / length.to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

# or

def averagemethod2(array)
  (array.reduce(:+)) / array.length.to_f
end

puts averagemethod2([1, 5, 87, 45, 8, 8])
puts averagemethod2([9, 47, 23, 95, 16, 52])
