cat = {name: "Monsieur", age: "unknown", colour: "grey", type: "longhair"}

cat.each do |k,v|
  puts k
end

cat.each do |k,v|
  puts v
end

cat.each do |k,v|
  puts "#{k}: #{v}"
end