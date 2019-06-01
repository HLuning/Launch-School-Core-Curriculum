# vowel = a e i o u

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)

hsh.each_value do |array|
  array.each do |word|
    word.chars.each do |char|
      print char if VOWELS.include?(char)
    end
  end
end

