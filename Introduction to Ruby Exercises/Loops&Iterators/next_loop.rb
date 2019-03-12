i = 0
loop do |variable|
  i += 2
  if i == 4
    next
  end
  puts i
  if i == 10
    break
  end
end