def joinor(array, delimiter1 = ', ', delimiter2 = 'or')
  if array.length > 2
    string1 = array.first((array.length) - 1).join(delimiter1)
    string2 = array.pop.to_s
    return string1 + "#{delimiter1} #{delimiter2} " + string2
  else
    array.join(" #{delimiter2} ")
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

