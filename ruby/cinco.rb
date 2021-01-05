#hashes
books = Hash.new
# :symbol this means an unique value, like a key
books[:author] = 'Mary Shelley'
books[:name]   = 'Frankenstein'

puts books

books[:author] = 'the boy'

puts books

puts books[:name]

#Regular Expressions
$sentence = 'Only here is magic and tragic'
puts $sentence
$agic = /.agic/.match($sentence)
puts $agic.length