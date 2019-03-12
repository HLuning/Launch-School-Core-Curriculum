my_array = ["kattenvoer", "koffiezetapparaat", "rugzak"]

my_array.each_with_index do |boodschap, i|
  puts "#{i}: #{boodschap}"
end