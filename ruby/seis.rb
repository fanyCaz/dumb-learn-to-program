#OOP
load 'song.rb'

class Book
    @sinopsis = nil
    #this is the constructor
    def initialize(name,author)
        #instace variables
        @name   = name
        @author = author
    end

    def sinopsis(sinps)
        @sinopsis = sinps
    end

    def writeSinopsis
        puts @sinopsis
    end
end

fransk = Book.new('frankenstein',\
                    'mary shelley')

#methods of a class in ruby
#puts fransk.methods.sort

puts 'yes' if fransk.respond_to?("sinopsis")
puts 'too' if fransk.respond_to?("loud")
fransk.sinopsis("a big monsta")
fransk::writeSinopsis()

fun = Song.new('man i feel like a woman','3:32','zangel',23)
fun.description()
#fun.display