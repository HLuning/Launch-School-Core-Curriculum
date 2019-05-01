def stringy(num)
  if num.even?
    '1' + ('01' * ((num - 2) / 2) + '0')
  else
    '1' + ('01' * ((num - 1) / 2))
  end
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
    