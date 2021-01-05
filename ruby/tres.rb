$thisIsGlobal = 1

def useCase
    $thisIsGlobal = 3
    puts $thisIsGlobal
end

puts $thisIsGlobal

useCase()

=begin
Global unique Ruby variables
puts $$
puts $:
puts $0
=end

puts "Cityyy: "
STDOUT.flush
=begin
buffer is a piece of harware
that stores data from I/O 
and the sends it to the right place
so, flush release this data
=end

city = gets.chomp

puts 'answer : '<<city

variableName = 2
$variableWithinAClass = 'sunflower'

puts $variableWithinAClass

puts self

#the "{variable} only works if using double quotation marks
puts "#{variableName} is the number now"

=begin
if you use a 'bang' method
it means that it will change the origin object
instead of a copy (recommended)
=end