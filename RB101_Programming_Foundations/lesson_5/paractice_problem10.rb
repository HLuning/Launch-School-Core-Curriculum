arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  incremented_hash = {}
  hash.map do |key, value|
    incremented_hash[key] = value + 1
  end

  incremented_hash
end

p arr
p new_arr
