
def count_to_zero(start) 
  if start >= 0
    puts start
    count_to_zero(start - 1)
  end
end

count_to_zero(7)