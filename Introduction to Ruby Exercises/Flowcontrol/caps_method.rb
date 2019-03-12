def caps_method(string)
  if string.length > 10
    string.upcase
  end
end

p caps_method("testing")
p caps_method("testingtestingtesting")