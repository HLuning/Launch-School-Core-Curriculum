def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}."
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}."
  end
end

person = {age: 62, city: "New York City"}

greeting("Bob")
greeting("Bob", person)
greeting("Bob", age: 55, city: "New York")