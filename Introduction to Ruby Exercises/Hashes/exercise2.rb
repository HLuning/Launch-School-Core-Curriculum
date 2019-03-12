# Illustrate the difference between the merge and merge! methods.
# Calling these methods on a hash.

nederland = {amsterdam: "grachten", rotterdam: "erasmusbrug", groningen: "martinitoren"}

belgie = {gent: "gravesteen", brussel: "manneken pis"}

puts "This is the original 'nederland' hash: #{nederland}"

nederland.merge(belgie) 

puts "This is the 'nederland' hash after merge method: #{nederland}"

nederland.merge!(belgie)

puts "This is the 'nederland' hash after merge! method: #{nederland}"