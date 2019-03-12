contains_lab = Proc.new do |string|
  if string.downcase =~ /lab/
    puts string
  end
end

words = ["laboratory",
"experiment",
"Pans Labyrinth",
"elaborate",
"polar bear"
]

words.each(&contains_lab)