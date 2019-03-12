# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

sis_bro = family.select do |title, names|
  (title == :sisters) || (title == :brothers)
end

sis_bro = sis_bro.values.flatten

p sis_bro