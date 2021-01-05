puts \
"heeey"

puts 5 / 2.0
puts 7 % 3

@nombre = "hola"
@nombre = nil
@nombreDos = @nombre || "pompom"    #assign 'pompom' if the first value is false
puts @nombreDos

def g *args
    args
end

def f arg
    arg #this means, is returning a value
end

x,y,z = [true,'two',false]

#declaration, assingment and bool comparison
#everything at the same time
if a = f(x) and b = f(y) and c = !f(z) then
    d = g(a,b,c)
end

p d
#UPPER CASE is for constants
PI = 3.433_222  #Underscore (_) to separate 'the thousands'

p PI    #p is puts

puts `dir`

