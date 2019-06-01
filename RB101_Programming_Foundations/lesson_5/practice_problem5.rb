munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_ages = []

munsters.each do |name, details|
  if munsters[name]["gender"] == "male"
    male_ages << munsters[name]["age"]
  end
end

p male_ages
p male_ages.sum