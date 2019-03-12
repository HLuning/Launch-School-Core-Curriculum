arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# arr.each { |num| puts num }

# arr.each { |num| puts num if num > 5 }

new_arr = arr.select { |num| num % 2 == 1 }

arr.push(11)
arr.unshift(0)
arr.delete(11)
arr << 3
arr.uniq!

p arr

hash1 = {:name => "Monsieur"}
hash2 = {name: "Monsieur"}